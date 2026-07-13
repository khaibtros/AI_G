import { z } from 'zod';

// ---- Auth Validators ----
export const registerSchema = z.object({
  email: z.string().email('Invalid email address'),
  password: z.string().min(6, 'Password must be at least 6 characters'),
  username: z.string().min(3, 'Username must be at least 3 characters').max(30).regex(/^[a-zA-Z0-9_]+$/, 'Username can only contain letters, numbers, and underscores'),
  display_name: z.string().min(1).max(50).optional(),
});

export const loginSchema = z.object({
  email: z.string().email('Invalid email address'),
  password: z.string().min(1, 'Password is required'),
});

export const forgotPasswordSchema = z.object({
  email: z.string().email('Invalid email address'),
});

export const refreshTokenSchema = z.object({
  refresh_token: z.string().min(1, 'Refresh token is required'),
});

// ---- Character Validators ----
// Helper: accept string or undefined (omit null - Flutter strips nulls before sending)
const optionalString = z.string().url().optional();
const optionalShortString = z.string().optional();
const optionalBoolean = z.boolean().optional();

export const createCharacterSchema = z.object({
  name: z.string().min(1, 'Name is required').max(50),
  tagline: optionalShortString,
  description: optionalShortString,
  avatar_url: optionalString,
  banner_url: optionalString,
  style: z.enum(['anime', 'realistic', 'cartoon', '3d', 'pixel']).optional().default('anime'),
  gender: z.enum(['male', 'female', 'non-binary', 'other']).optional().default('female'),
  appearance: z.object({
    hair_color: z.string().optional(),
    eye_color: z.string().optional(),
    body_type: z.string().optional(),
    outfit: z.string().optional(),
    distinguishing_features: z.string().optional(),
    age_appearance: z.string().optional(),
  }).optional(),
  personality: z.object({
    traits: z.array(z.string()).optional(),
    interests: z.array(z.string()).optional(),
    communication_style: z.string().optional(),
    backstory: z.string().max(5000).optional(),
    quirks: z.array(z.string()).optional(),
    likes: z.array(z.string()).optional(),
    dislikes: z.array(z.string()).optional(),
    speaking_tone: z.string().optional(),
  }).optional(),
  system_prompt: z.string().max(5000).optional(),
  greeting_message: z.string().max(500).optional(),
  categories: z.array(z.string()).optional(),
  is_public: z.boolean().optional().default(true),
  is_nsfw: z.boolean().optional().default(false),
});

export const updateCharacterSchema = createCharacterSchema.partial();

export const characterListQuerySchema = z.object({
  page: z.coerce.number().int().min(1).default(1),
  limit: z.coerce.number().int().min(1).max(50).default(20),
  gender: z.enum(['male', 'female', 'non-binary', 'other']).optional(),
  style: z.enum(['anime', 'realistic', 'cartoon', '3d', 'pixel']).optional(),
  category: z.string().optional(),
  sort: z.enum(['popular', 'newest', 'name']).default('popular'),
  search: z.string().optional(),
  is_nsfw: z.coerce.boolean().optional(),
});

// ---- Chat Validators ----
export const sendMessageSchema = z.object({
  content: z.string().min(1, 'Message cannot be empty').max(5000),
});

// ---- Profile Validators ----
export const updateProfileSchema = z.object({
  display_name: z.string().min(1).max(50).optional(),
  avatar_url: z.string().url().optional(),
  bio: z.string().max(500).optional(),
  username: z.string().min(3).max(30).regex(/^[a-zA-Z0-9_]+$/).optional(),
});
