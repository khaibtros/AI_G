import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../../core/network/dio_client.dart';
import '../../../shared/models/profile.dart';
import '../../../shared/models/character.dart';

// ── Admin Dashboard Stats ──────────────────────────────────────
class AdminStats {
  final int totalUsers;
  final int totalCharacters;
  final int totalConversations;
  final int activeSubscriptions;
  final int newUsersThisWeek;
  final int totalMessages;
  final double estimatedRevenue;
  final Map<String, int> tierBreakdown;

  const AdminStats({
    this.totalUsers = 0,
    this.totalCharacters = 0,
    this.totalConversations = 0,
    this.activeSubscriptions = 0,
    this.newUsersThisWeek = 0,
    this.totalMessages = 0,
    this.estimatedRevenue = 0,
    this.tierBreakdown = const {'free': 0, 'starter': 0, 'pro': 0, 'ultimate': 0},
  });

  AdminStats copyWith({
    int? totalUsers,
    int? totalCharacters,
    int? totalConversations,
    int? activeSubscriptions,
    int? newUsersThisWeek,
    int? totalMessages,
    double? estimatedRevenue,
    Map<String, int>? tierBreakdown,
  }) {
    return AdminStats(
      totalUsers: totalUsers ?? this.totalUsers,
      totalCharacters: totalCharacters ?? this.totalCharacters,
      totalConversations: totalConversations ?? this.totalConversations,
      activeSubscriptions: activeSubscriptions ?? this.activeSubscriptions,
      newUsersThisWeek: newUsersThisWeek ?? this.newUsersThisWeek,
      totalMessages: totalMessages ?? this.totalMessages,
      estimatedRevenue: estimatedRevenue ?? this.estimatedRevenue,
      tierBreakdown: tierBreakdown ?? this.tierBreakdown,
    );
  }
}

// ── User Detail ────────────────────────────────────────────────
class UserDetail {
  final Profile profile;
  final int conversationCount;
  final int favoriteCount;
  final List<Map<String, dynamic>> recentTransactions;
  final List<Map<String, dynamic>> subscriptions;

  const UserDetail({
    required this.profile,
    this.conversationCount = 0,
    this.favoriteCount = 0,
    this.recentTransactions = const [],
    this.subscriptions = const [],
  });
}

// ── Character Detail ───────────────────────────────────────────
class CharacterDetail {
  final Character character;
  final int conversationCount;
  final Map<String, dynamic>? creator;

  const CharacterDetail({
    required this.character,
    this.conversationCount = 0,
    this.creator,
  });
}

// ── Paginated Response ─────────────────────────────────────────
class PaginatedList<T> {
  final List<T> items;
  final int total;
  final int page;
  final int totalPages;

  const PaginatedList({
    this.items = const [],
    this.total = 0,
    this.page = 1,
    this.totalPages = 1,
  });

  PaginatedList<T> copyWith({
    List<T>? items,
    int? total,
    int? page,
    int? totalPages,
  }) {
    return PaginatedList<T>(
      items: items ?? this.items,
      total: total ?? this.total,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
    );
  }
}

// ── Admin State ────────────────────────────────────────────────
class AdminState {
  final AdminStats stats;
  final PaginatedList<Profile> users;
  final PaginatedList<Character> characters;
  final List<Map<String, dynamic>> subscriptions;
  final List<Map<String, dynamic>> coinTransactions;
  final Map<String, dynamic> recentActivity;
  final bool isLoading;
  final bool isLoadingDetail;
  final String? error;

  // Search & Filter State
  final String userSearch;
  final String userTierFilter;
  final String userSort;
  final String characterSearch;
  final String characterStyleFilter;
  final String characterGenderFilter;
  final String characterVisibilityFilter;
  final String characterSort;
  final String subscriptionStatusFilter;
  final String transactionTypeFilter;
  final int currentAdminNavIndex;

  const AdminState({
    this.stats = const AdminStats(),
    this.users = const PaginatedList(),
    this.characters = const PaginatedList(),
    this.subscriptions = const [],
    this.coinTransactions = const [],
    this.recentActivity = const {},
    this.isLoading = false,
    this.isLoadingDetail = false,
    this.error,
    this.userSearch = '',
    this.userTierFilter = 'all',
    this.userSort = 'newest',
    this.characterSearch = '',
    this.characterStyleFilter = 'all',
    this.characterGenderFilter = 'all',
    this.characterVisibilityFilter = 'all',
    this.characterSort = 'newest',
    this.subscriptionStatusFilter = 'all',
    this.transactionTypeFilter = 'all',
    this.currentAdminNavIndex = 0,
  });

  AdminState copyWith({
    AdminStats? stats,
    PaginatedList<Profile>? users,
    PaginatedList<Character>? characters,
    List<Map<String, dynamic>>? subscriptions,
    List<Map<String, dynamic>>? coinTransactions,
    Map<String, dynamic>? recentActivity,
    bool? isLoading,
    bool? isLoadingDetail,
    String? error,
    String? userSearch,
    String? userTierFilter,
    String? userSort,
    String? characterSearch,
    String? characterStyleFilter,
    String? characterGenderFilter,
    String? characterVisibilityFilter,
    String? characterSort,
    String? subscriptionStatusFilter,
    String? transactionTypeFilter,
    int? currentAdminNavIndex,
  }) {
    return AdminState(
      stats: stats ?? this.stats,
      users: users ?? this.users,
      characters: characters ?? this.characters,
      subscriptions: subscriptions ?? this.subscriptions,
      coinTransactions: coinTransactions ?? this.coinTransactions,
      recentActivity: recentActivity ?? this.recentActivity,
      isLoading: isLoading ?? this.isLoading,
      isLoadingDetail: isLoadingDetail ?? this.isLoadingDetail,
      error: error,
      userSearch: userSearch ?? this.userSearch,
      userTierFilter: userTierFilter ?? this.userTierFilter,
      userSort: userSort ?? this.userSort,
      characterSearch: characterSearch ?? this.characterSearch,
      characterStyleFilter: characterStyleFilter ?? this.characterStyleFilter,
      characterGenderFilter: characterGenderFilter ?? this.characterGenderFilter,
      characterVisibilityFilter: characterVisibilityFilter ?? this.characterVisibilityFilter,
      characterSort: characterSort ?? this.characterSort,
      subscriptionStatusFilter: subscriptionStatusFilter ?? this.subscriptionStatusFilter,
      transactionTypeFilter: transactionTypeFilter ?? this.transactionTypeFilter,
      currentAdminNavIndex: currentAdminNavIndex ?? this.currentAdminNavIndex,
    );
  }
}

// ── Admin Notifier ─────────────────────────────────────────────
class AdminNotifier extends Notifier<AdminState> {
  @override
  AdminState build() => AdminState();

  Dio get _dio => DioClient.instance.dio;

  void setAdminNavIndex(int index) {
    state = state.copyWith(currentAdminNavIndex: index);
  }

  // ── Dashboard Stats ────────────────────────────────────────
  Future<void> fetchStats() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await _dio.get('/admin/stats');
      final data = response.data['data'];
      state = state.copyWith(
        stats: AdminStats(
          totalUsers: data['users'] ?? 0,
          totalCharacters: data['characters'] ?? 0,
          totalConversations: data['conversations'] ?? 0,
          activeSubscriptions: data['activeSubscriptions'] ?? 0,
          newUsersThisWeek: data['newUsersThisWeek'] ?? 0,
          totalMessages: data['totalMessages'] ?? 0,
          estimatedRevenue: (data['estimatedRevenue'] ?? 0).toDouble(),
          tierBreakdown: Map<String, int>.from(data['tierBreakdown'] ?? {}),
        ),
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // ── Recent Activity ────────────────────────────────────────
  Future<void> fetchRecentActivity() async {
    try {
      final response = await _dio.get('/admin/activity');
      state = state.copyWith(recentActivity: response.data['data'] ?? {});
    } catch (e) {
      // Non-critical, don't update error state
    }
  }

  // ── Users ──────────────────────────────────────────────────
  Future<void> fetchUsers({int page = 1}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final params = <String, dynamic>{
        'page': page.toString(),
        'limit': '50',
      };
      if (state.userSearch.isNotEmpty) params['search'] = state.userSearch;
      if (state.userTierFilter != 'all') params['tier'] = state.userTierFilter;
      params['sort'] = state.userSort;

      final response = await _dio.get('/admin/users', queryParameters: params);
      final data = response.data;

      final users = (data['data'] as List)
          .map((e) => Profile.fromJson(e))
          .toList();

      state = state.copyWith(
        users: PaginatedList<Profile>(
          items: users,
          total: data['total'] ?? 0,
          page: data['page'] ?? 1,
          totalPages: data['totalPages'] ?? 1,
        ),
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void setUserSearch(String search) {
    state = state.copyWith(userSearch: search);
  }

  void setUserTierFilter(String tier) {
    state = state.copyWith(userTierFilter: tier);
  }

  void setUserSort(String sort) {
    state = state.copyWith(userSort: sort);
  }

  Future<UserDetail?> getUserDetail(String userId) async {
    state = state.copyWith(isLoadingDetail: true);
    try {
      final response = await _dio.get('/admin/users/$userId');
      final data = response.data['data'];
      state = state.copyWith(isLoadingDetail: false);
      return UserDetail(
        profile: Profile.fromJson(data),
        conversationCount: data['conversationCount'] ?? 0,
        favoriteCount: data['favoriteCount'] ?? 0,
        recentTransactions: List<Map<String, dynamic>>.from(
          (data['recentTransactions'] ?? []).map((e) => Map<String, dynamic>.from(e)),
        ),
        subscriptions: List<Map<String, dynamic>>.from(
          (data['subscriptions'] ?? []).map((e) => Map<String, dynamic>.from(e)),
        ),
      );
    } catch (e) {
      state = state.copyWith(isLoadingDetail: false);
      return null;
    }
  }

  Future<bool> updateUserBalance(String userId, int coins) async {
    try {
      final response = await _dio.put(
        '/admin/users/$userId/balance',
        data: {'coins': coins},
      );
      if (response.data['success'] == true) {
        // Refresh users list
        await fetchUsers();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> banUser(String userId) async {
    try {
      await _dio.delete('/admin/users/$userId');
      state = state.copyWith(
        users: state.users.copyWith(
          items: state.users.items.where((u) => u.id != userId).toList(),
          total: state.users.total - 1,
        ),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  // ── Characters ─────────────────────────────────────────────
  Future<void> fetchCharacters({int page = 1}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final params = <String, dynamic>{
        'page': page.toString(),
        'limit': '50',
      };
      if (state.characterSearch.isNotEmpty) params['search'] = state.characterSearch;
      if (state.characterStyleFilter != 'all') params['style'] = state.characterStyleFilter;
      if (state.characterGenderFilter != 'all') params['gender'] = state.characterGenderFilter;
      if (state.characterVisibilityFilter != 'all') {
        params['visibility'] = state.characterVisibilityFilter;
      }
      params['sort'] = state.characterSort;

      final response = await _dio.get('/admin/characters', queryParameters: params);
      final data = response.data;

      final characters = (data['data'] as List)
          .map((e) => Character.fromJson(e))
          .toList();

      state = state.copyWith(
        characters: PaginatedList<Character>(
          items: characters,
          total: data['total'] ?? 0,
          page: data['page'] ?? 1,
          totalPages: data['totalPages'] ?? 1,
        ),
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void setCharacterSearch(String search) {
    state = state.copyWith(characterSearch: search);
  }

  void setCharacterStyleFilter(String style) {
    state = state.copyWith(characterStyleFilter: style);
  }

  void setCharacterGenderFilter(String gender) {
    state = state.copyWith(characterGenderFilter: gender);
  }

  void setCharacterVisibilityFilter(String visibility) {
    state = state.copyWith(characterVisibilityFilter: visibility);
  }

  void setCharacterSort(String sort) {
    state = state.copyWith(characterSort: sort);
  }

  Future<CharacterDetail?> getCharacterDetail(String characterId) async {
    state = state.copyWith(isLoadingDetail: true);
    try {
      final response = await _dio.get('/admin/characters/$characterId');
      final data = response.data['data'];
      state = state.copyWith(isLoadingDetail: false);
      return CharacterDetail(
        character: Character.fromJson(data),
        conversationCount: data['conversationCount'] ?? 0,
        creator: data['creator'] != null
            ? Map<String, dynamic>.from(data['creator'])
            : null,
      );
    } catch (e) {
      state = state.copyWith(isLoadingDetail: false);
      return null;
    }
  }

  Future<bool> toggleCharacterPublic(String characterId) async {
    try {
      final response = await _dio.put('/admin/characters/$characterId/toggle-public');
      if (response.data['success'] == true) {
        await fetchCharacters();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteCharacter(String characterId) async {
    try {
      await _dio.delete('/admin/characters/$characterId');
      state = state.copyWith(
        characters: state.characters.copyWith(
          items: state.characters.items.where((c) => c.id != characterId).toList(),
          total: state.characters.total - 1,
        ),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  // ── Subscriptions ──────────────────────────────────────────
  void setSubscriptionStatusFilter(String status) {
    state = state.copyWith(subscriptionStatusFilter: status);
  }

  Future<void> fetchSubscriptions() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final params = <String, dynamic>{};
      if (state.subscriptionStatusFilter != 'all') {
        params['status'] = state.subscriptionStatusFilter;
      }

      final response = await _dio.get('/admin/subscriptions', queryParameters: params);
      state = state.copyWith(
        subscriptions: List<Map<String, dynamic>>.from(
          (response.data['data'] ?? []).map((e) => Map<String, dynamic>.from(e)),
        ),
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // ── Coin Transactions ──────────────────────────────────────
  void setTransactionTypeFilter(String type) {
    state = state.copyWith(transactionTypeFilter: type);
  }

  Future<void> fetchCoinTransactions() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final params = <String, dynamic>{};
      if (state.transactionTypeFilter != 'all') {
        params['type'] = state.transactionTypeFilter;
      }

      final response = await _dio.get('/admin/transactions', queryParameters: params);
      state = state.copyWith(
        coinTransactions: List<Map<String, dynamic>>.from(
          (response.data['data'] ?? []).map((e) => Map<String, dynamic>.from(e)),
        ),
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // ── Reset Filters ──────────────────────────────────────────
  void resetUserFilters() {
    state = state.copyWith(
      userSearch: '',
      userTierFilter: 'all',
      userSort: 'newest',
    );
  }

  void resetCharacterFilters() {
    state = state.copyWith(
      characterSearch: '',
      characterStyleFilter: 'all',
      characterGenderFilter: 'all',
      characterVisibilityFilter: 'all',
      characterSort: 'newest',
    );
  }
}

final adminProvider = NotifierProvider<AdminNotifier, AdminState>(
  AdminNotifier.new,
);
