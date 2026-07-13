import { Response, NextFunction } from 'express';
import { supabaseAdmin } from '../config/supabase';
import { AuthRequest } from '../middleware/auth';

export class AdminController {
  // ── Dashboard Stats ──────────────────────────────────────────
  async getStats(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const [
        { count: usersCount },
        { count: charactersCount },
        { count: conversationsCount },
        { count: subscriptionsCount },
      ] = await Promise.all([
        supabaseAdmin.from('profiles').select('*', { count: 'exact', head: true }),
        supabaseAdmin.from('characters').select('*', { count: 'exact', head: true }),
        supabaseAdmin.from('conversations').select('*', { count: 'exact', head: true }),
        supabaseAdmin.from('subscriptions').select('*', { count: 'exact', head: true }).eq('status', 'active'),
      ]);

      // Subscription tier breakdown
      const { data: tierData } = await supabaseAdmin
        .from('profiles')
        .select('subscription_tier');

      const tierBreakdown = { free: 0, starter: 0, pro: 0, ultimate: 0 };
      (tierData || []).forEach((row: any) => {
        const tier = row.subscription_tier || 'free';
        if (tier in tierBreakdown) tierBreakdown[tier as keyof typeof tierBreakdown]++;
      });

      // Revenue estimate (from coin purchases — each starter=4.99, pro=12.99, ultimate=29.99)
      const planPrices: Record<string, number> = { starter: 4.99, pro: 12.99, ultimate: 29.99 };
      const estimatedRevenue =
        (tierBreakdown.starter * planPrices.starter) +
        (tierBreakdown.pro * planPrices.pro) +
        (tierBreakdown.ultimate * planPrices.ultimate);

      // New users this week
      const oneWeekAgo = new Date();
      oneWeekAgo.setDate(oneWeekAgo.getDate() - 7);
      const { count: newUsersThisWeek } = await supabaseAdmin
        .from('profiles')
        .select('*', { count: 'exact', head: true })
        .gte('created_at', oneWeekAgo.toISOString());

      // Total messages (from conversations)
      const { data: msgData } = await supabaseAdmin
        .from('conversations')
        .select('message_count');
      const totalMessages = (msgData || []).reduce(
        (sum: number, row: any) => sum + (row.message_count || 0), 0
      );

      res.json({
        success: true,
        data: {
          users: usersCount || 0,
          characters: charactersCount || 0,
          conversations: conversationsCount || 0,
          activeSubscriptions: subscriptionsCount || 0,
          tierBreakdown,
          estimatedRevenue: Math.round(estimatedRevenue * 100) / 100,
          newUsersThisWeek: newUsersThisWeek || 0,
          totalMessages,
        },
      });
    } catch (error) {
      next(error);
    }
  }

  // ── Users ────────────────────────────────────────────────────
  async getUsers(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const { search, tier, sort, page = '1', limit = '50' } = req.query as Record<string, string>;
      const pageNum = parseInt(page) || 1;
      const limitNum = Math.min(parseInt(limit) || 50, 200);
      const offset = (pageNum - 1) * limitNum;

      let q = supabaseAdmin
        .from('profiles')
        .select('*', { count: 'exact' });

      if (search) {
        q = q.or(`username.ilike.%${search}%,display_name.ilike.%${search}%`);
      }
      if (tier && tier !== 'all') {
        q = q.eq('subscription_tier', tier);
      }

      // Sorting
      switch (sort) {
        case 'newest': q = q.order('created_at', { ascending: false }); break;
        case 'oldest': q = q.order('created_at', { ascending: true }); break;
        case 'name': q = q.order('username', { ascending: true }); break;
        case 'coins_high': q = q.order('coin_balance', { ascending: false }); break;
        default: q = q.order('created_at', { ascending: false });
      }

      q = q.range(offset, offset + limitNum - 1);

      const { data, error, count } = await q;
      if (error) throw error;

      res.json({
        success: true,
        data,
        total: count || 0,
        page: pageNum,
        limit: limitNum,
        totalPages: Math.ceil((count || 0) / limitNum),
      });
    } catch (error) {
      next(error);
    }
  }

  async getUserDetail(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const { id } = req.params;

      const { data: profile, error } = await supabaseAdmin
        .from('profiles')
        .select('*')
        .eq('id', id)
        .single();

      if (error || !profile) {
        return res.status(404).json({ success: false, error: 'User not found' });
      }

      // Get subscription info
      const { data: subscription } = await supabaseAdmin
        .from('subscriptions')
        .select('*')
        .eq('user_id', id)
        .order('created_at', { ascending: false })
        .limit(5);

      // Get conversation count
      const { count: conversationCount } = await supabaseAdmin
        .from('conversations')
        .select('*', { count: 'exact', head: true })
        .eq('user_id', id);

      // Get character favorite count
      const { count: favoriteCount } = await supabaseAdmin
        .from('user_favorites')
        .select('*', { count: 'exact', head: true })
        .eq('user_id', id);

      // Get recent coin transactions
      const { data: recentTransactions } = await supabaseAdmin
        .from('coin_transactions')
        .select('*')
        .eq('user_id', id)
        .order('created_at', { ascending: false })
        .limit(10);

      res.json({
        success: true,
        data: {
          ...profile,
          subscriptions: subscription || [],
          conversationCount: conversationCount || 0,
          favoriteCount: favoriteCount || 0,
          recentTransactions: recentTransactions || [],
        },
      });
    } catch (error) {
      next(error);
    }
  }

  async updateUserBalance(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const { id } = req.params;
      const { coins } = req.body;

      if (typeof coins !== 'number') {
        return res.status(400).json({ success: false, error: 'coins must be a number' });
      }

      const { data: profile, error: fetchError } = await supabaseAdmin
        .from('profiles')
        .select('coin_balance')
        .eq('id', id)
        .single();

      if (fetchError || !profile) {
        return res.status(404).json({ success: false, error: 'User not found' });
      }

      const newBalance = Math.max(0, (profile.coin_balance || 0) + coins);

      const { error } = await supabaseAdmin
        .from('profiles')
        .update({ coin_balance: newBalance })
        .eq('id', id);

      if (error) throw error;

      // Record the admin adjustment transaction
      await supabaseAdmin.from('coin_transactions').insert({
        user_id: id,
        amount: coins,
        balance_after: newBalance,
        type: 'reward',
        description: `Admin ${coins >= 0 ? 'granted' : 'deducted'} ${Math.abs(coins)} coins`,
      });

      res.json({
        success: true,
        data: { coinBalance: newBalance },
        message: `Balance updated: ${coins >= 0 ? '+' : ''}${coins} coins`,
      });
    } catch (error) {
      next(error);
    }
  }

  async banUser(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const { id } = req.params;
      const { error } = await supabaseAdmin.auth.admin.deleteUser(id);
      if (error) throw error;
      res.json({ success: true, message: 'User banned' });
    } catch (error) {
      next(error);
    }
  }

  // ── Characters ───────────────────────────────────────────────
  async getCharacters(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const { search, style, gender, visibility, sort, page = '1', limit = '50' } = req.query as Record<string, string>;
      const pageNum = parseInt(page) || 1;
      const limitNum = Math.min(parseInt(limit) || 50, 200);
      const offset = (pageNum - 1) * limitNum;

      let q = supabaseAdmin
        .from('characters')
        .select('*', { count: 'exact' });

      if (search) {
        q = q.or(`name.ilike.%${search}%,tagline.ilike.%${search}%`);
      }
      if (style && style !== 'all') {
        q = q.eq('style', style);
      }
      if (gender && gender !== 'all') {
        q = q.eq('gender', gender);
      }
      if (visibility === 'public') q = q.eq('is_public', true);
      if (visibility === 'private') q = q.eq('is_public', false);

      switch (sort) {
        case 'popular': q = q.order('chat_count', { ascending: false }); break;
        case 'newest': q = q.order('created_at', { ascending: false }); break;
        case 'name': q = q.order('name', { ascending: true }); break;
        case 'favorites': q = q.order('favorite_count', { ascending: false }); break;
        default: q = q.order('created_at', { ascending: false });
      }

      q = q.range(offset, offset + limitNum - 1);

      const { data, error, count } = await q;
      if (error) throw error;

      res.json({
        success: true,
        data,
        total: count || 0,
        page: pageNum,
        limit: limitNum,
        totalPages: Math.ceil((count || 0) / limitNum),
      });
    } catch (error) {
      next(error);
    }
  }

  async getCharacterDetail(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const { id } = req.params;

      const { data: character, error } = await supabaseAdmin
        .from('characters')
        .select('*')
        .eq('id', id)
        .single();

      if (error || !character) {
        return res.status(404).json({ success: false, error: 'Character not found' });
      }

      // Get creator info
      let creator = null;
      if (character.creator_id) {
        const { data } = await supabaseAdmin
          .from('profiles')
          .select('id, username, display_name, avatar_url')
          .eq('id', character.creator_id)
          .single();
        creator = data;
      }

      // Get conversation count for this character
      const { count: conversationCount } = await supabaseAdmin
        .from('conversations')
        .select('*', { count: 'exact', head: true })
        .eq('character_id', id);

      res.json({
        success: true,
        data: {
          ...character,
          creator,
          conversationCount: conversationCount || 0,
        },
      });
    } catch (error) {
      next(error);
    }
  }

  async toggleCharacterPublic(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const { id } = req.params;

      // Get current state
      const { data: character, error: fetchError } = await supabaseAdmin
        .from('characters')
        .select('is_public')
        .eq('id', id)
        .single();

      if (fetchError || !character) {
        return res.status(404).json({ success: false, error: 'Character not found' });
      }

      const { error } = await supabaseAdmin
        .from('characters')
        .update({ is_public: !character.is_public })
        .eq('id', id);

      if (error) throw error;

      res.json({
        success: true,
        data: { isPublic: !character.is_public },
        message: `Character is now ${!character.is_public ? 'public' : 'private'}`,
      });
    } catch (error) {
      next(error);
    }
  }

  async deleteCharacter(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const { id } = req.params;
      const { error } = await supabaseAdmin
        .from('characters')
        .delete()
        .eq('id', id);
      if (error) throw error;
      res.json({ success: true, message: 'Character deleted' });
    } catch (error) {
      next(error);
    }
  }

  // ── Subscriptions Overview ───────────────────────────────────
  async getSubscriptions(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const { status = 'all', page = '1', limit = '50' } = req.query as Record<string, string>;
      const pageNum = parseInt(page) || 1;
      const limitNum = Math.min(parseInt(limit) || 50, 200);
      const offset = (pageNum - 1) * limitNum;

      let q = supabaseAdmin
        .from('subscriptions')
        .select('*, profiles:user_id(id, username, display_name, avatar_url)', { count: 'exact' });

      if (status && status !== 'all') {
        q = q.eq('status', status);
      }

      q = q.order('created_at', { ascending: false }).range(offset, offset + limitNum - 1);

      const { data, error, count } = await q;
      if (error) throw error;

      res.json({
        success: true,
        data,
        total: count || 0,
        page: pageNum,
        limit: limitNum,
        totalPages: Math.ceil((count || 0) / limitNum),
      });
    } catch (error) {
      next(error);
    }
  }

  // ── Coin Transactions Overview ───────────────────────────────
  async getCoinTransactions(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const { type, page = '1', limit = '50' } = req.query as Record<string, string>;
      const pageNum = parseInt(page) || 1;
      const limitNum = Math.min(parseInt(limit) || 50, 200);
      const offset = (pageNum - 1) * limitNum;

      let q = supabaseAdmin
        .from('coin_transactions')
        .select('*, profiles:user_id(id, username, display_name, avatar_url)', { count: 'exact' });

      if (type && type !== 'all') {
        q = q.eq('type', type);
      }

      q = q.order('created_at', { ascending: false }).range(offset, offset + limitNum - 1);

      const { data, error, count } = await q;
      if (error) throw error;

      res.json({
        success: true,
        data,
        total: count || 0,
        page: pageNum,
        limit: limitNum,
        totalPages: Math.ceil((count || 0) / limitNum),
      });
    } catch (error) {
      next(error);
    }
  }

  // ── Recent Activity ──────────────────────────────────────────
  async getRecentActivity(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const limit = Math.min(parseInt(req.query.limit as string) || 20, 100);

      const [usersResult, charactersResult, conversationsResult] = await Promise.all([
        supabaseAdmin
          .from('profiles')
          .select('id, username, display_name, avatar_url, created_at, subscription_tier')
          .order('created_at', { ascending: false })
          .limit(limit),
        supabaseAdmin
          .from('characters')
          .select('id, name, tagline, avatar_url, created_at, chat_count')
          .order('created_at', { ascending: false })
          .limit(limit),
        supabaseAdmin
          .from('conversations')
          .select('id, created_at, last_message_at, message_count, user_id, character_id')
          .order('last_message_at', { ascending: false })
          .limit(limit),
      ]);

      res.json({
        success: true,
        data: {
          recentUsers: usersResult.data || [],
          recentCharacters: charactersResult.data || [],
          recentConversations: conversationsResult.data || [],
        },
      });
    } catch (error) {
      next(error);
    }
  }
}

export const adminController = new AdminController();
