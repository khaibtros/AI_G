import dotenv from 'dotenv';
dotenv.config();

import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.SUPABASE_URL!;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY!;

if (!supabaseUrl || !supabaseServiceKey) {
  console.error('❌ Missing SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY in .env');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseServiceKey);
const OLD_HOST = 'http://10.0.2.2:3001';

async function fixUrls() {
  console.log('🔧 Fixing image URLs in database...\n');

  const { data: characters, error: fetchError } = await supabase
    .from('characters')
    .select('id, name, avatar_url, banner_url');

  if (fetchError) {
    console.error('❌ Failed to fetch characters:', fetchError.message);
    process.exit(1);
  }

  let updated = 0;

  for (const char of characters!) {
    const updates: Record<string, string | null> = {};

    if (char.avatar_url?.startsWith(OLD_HOST)) {
      updates.avatar_url = char.avatar_url.replace(OLD_HOST, '');
    }
    if (char.banner_url?.startsWith(OLD_HOST)) {
      updates.banner_url = char.banner_url.replace(OLD_HOST, '');
    }

    if (Object.keys(updates).length > 0) {
      const { error } = await supabase
        .from('characters')
        .update(updates)
        .eq('id', char.id);

      if (error) {
        console.error(`  ❌ Failed to update "${char.name}":`, error.message);
      } else {
        console.log(`  ✅ ${char.name}: ${JSON.stringify(updates)}`);
        updated++;
      }
    }
  }

  console.log(`\n🔧 Done: ${updated} characters updated out of ${characters!.length} total`);
}

fixUrls().catch(console.error);
