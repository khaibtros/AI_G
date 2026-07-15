# AI Companions - Testing & Deployment Guide

This guide covers testing the Flutter web build locally and deploying the backend (Render) and frontend (Vercel) so users with a computer can access the app via browser.

---

## Table of Contents

1. [Testing the Web Build Locally](#1-testing-the-web-build-locally)
2. [Deploying the Backend on Render](#2-deploying-the-backend-on-render)
3. [Deploying the Frontend on Vercel](#3-deploying-the-frontend-on-vercel)
4. [Environment Variables Reference](#4-environment-variables-reference)
5. [Known Limitations](#5-known-limitations)
6. [Troubleshooting](#6-troubleshooting)

---

## 1. Testing the Web Build Locally

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) >= 3.8.0
- [Node.js](https://nodejs.org/) >= 18
- Chrome or Edge browser

### Step 1: Start the Backend

```bash
# From the project root
npm install
npm run build
npm run server:dev
```

The server starts at `http://localhost:3001`. Verify it's running:

```bash
curl http://localhost:3001/api/health
# Should return: {"status":"ok","timestamp":"..."}
```

### Step 2: Update the Flutter `.env` for Web

Edit `ai_companions_flutter/.env` and set the API URL to localhost:

```
EXPO_PUBLIC_API_URL=http://localhost:3001/api/v1
EXPO_PUBLIC_SUPABASE_URL=https://gvqujztumcpytgqddtbd.supabase.co
EXPO_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
```

> On web, `flutter_dotenv` loads `.env` as a Flutter asset. The URL must be reachable from the browser.

### Step 3: Run Flutter Web

```bash
cd ai_companions_flutter
flutter pub get
flutter run -d chrome
```

This opens the app in Chrome at `http://localhost:8080`.

### Step 4: Build for Production (Optional Test)

```bash
cd ai_companions_flutter
flutter build web --release
```

The output is in `build/web/`. You can preview it locally:

```bash
cd ai_companions_flutter/build/web
python3 -m http.server 8000   # or: npx serve .
```

Open `http://localhost:8000` in your browser.

---

## 2. Deploying the Backend on Render

### Prerequisites

- A [GitHub](https://github.com) repository with your project pushed
- A [Render](https://render.com) account (free tier works)

### Step 1: Prepare the Server

The server depends on the `shared/` package (monorepo). Render will install and build from the project root, so the build commands handle both packages.

No changes are needed to the code. Verify `server/package.json` has:

```json
{
  "scripts": {
    "build": "tsc",
    "start": "node dist/index.js"
  }
}
```

### Step 2: Create the Web Service on Render

1. Go to [Render Dashboard](https://dashboard.render.com)
2. Click **New +** > **Web Service**
3. Connect your GitHub repository
4. Configure the service:

| Setting | Value |
|---|---|
| **Name** | `ai-companions-api` |
| **Region** | Oregon (US West) or closest to your users |
| **Branch** | `main` (or your default branch) |
| **Runtime** | Node |
| **Build Command** | `npm install && npm run build` |
| **Start Command** | `node dist/index.js` |
| **Instance Type** | Free (or Starter for production) |

> The build command runs from the project root. The `postinstall` script in the root `package.json` automatically builds the `shared/` package after `npm install`. Then `npm run build` compiles both `shared/` and `server/`.

### Step 3: Set Environment Variables

In the Render dashboard, go to **Environment** and add:

| Variable | Value |
|---|---|
| `SUPABASE_URL` | `https://gvqujztumcpytgqddtbd.supabase.co` |
| `SUPABASE_ANON_KEY` | Your Supabase anon key |
| `SUPABASE_SERVICE_ROLE_KEY` | Your Supabase service role key |
| `OPENAI_API_KEY` | Your OpenAI API key |
| `NODE_ENV` | `production` |
| `PORT` | `3001` |

### Step 4: Deploy

Click **Create Web Service**. Render will:
1. Clone your repo
2. Run `npm install` (triggers `postinstall` -> builds `shared/`)
3. Run `npm run build` (builds `server/`)
4. Run `node dist/index.js`

### Step 5: Verify

After deployment completes, test the health endpoint:

```bash
curl https://ai-companions-api.onrender.com/api/health
# Should return: {"status":"ok","timestamp":"..."}
```

> **Note:** Free tier instances spin down after inactivity. The first request after idle may take 30-60 seconds.

---

## 3. Deploying the Frontend on Vercel

### Prerequisites

- A [Vercel](https://vercel.com) account (free tier works)
- Flutter SDK installed locally (to build) OR use a custom build command
- Your backend deployed and running on Render

### Important: Vercel + Flutter Web

Vercel is designed for static sites and serverless functions. Flutter web outputs a static site (`build/web/`), so it works well on Vercel. However, Vercel does not have Flutter SDK pre-installed, so you have two options:

**Option A:** Build locally and deploy the `build/web/` output (recommended for simplicity).

**Option B:** Use a custom build script with a Flutter Docker image (more complex, fully automated).

Both options are detailed below.

---

### Option A: Build Locally and Deploy (Recommended)

#### Step 1: Update `.env` for Production

Edit `ai_companions_flutter/.env` with your deployed backend URL:

```
EXPO_PUBLIC_API_URL=https://ai-companions-api.onrender.com/api/v1
EXPO_PUBLIC_SUPABASE_URL=https://gvqujztumcpytgqddtbd.supabase.co
EXPO_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
```

#### Step 2: Build Flutter Web

```bash
cd ai_companions_flutter
flutter pub get
flutter build web --release
```

The output is in `ai_companions_flutter/build/web/`.

#### Step 3: Deploy to Vercel

**Via Vercel CLI:**

```bash
npm install -g vercel
cd ai_companions_flutter/build/web
vercel
```

Follow the prompts:
- Set up and deploy? **Y**
- Which scope? (select yours)
- Link to existing project? **N**
- Project name? **ai-companions**
- Directory is `./`? **Y**
- Want to override settings? **N**

For production deployment:

```bash
vercel --prod
```

**Via Vercel Dashboard:**

1. Go to [vercel.com/new](https://vercel.com/new)
2. Import your GitHub repo (or upload the `build/web/` folder)
3. If uploading, use the **"Upload"** tab and select `ai_companions_flutter/build/web/`
4. Deploy

#### Step 4: Configure `vercel.json` (Optional but Recommended)

Create `ai_companions_flutter/build/web/vercel.json` to handle SPA routing:

```json
{
  "rewrites": [
    { "source": "/(.*)", "destination": "/index.html" }
  ]
}
```

Or place a `vercel.json` in the Flutter project root (`ai_companions_flutter/vercel.json`):

```json
{
  "buildCommand": "flutter build web --release",
  "outputDirectory": "build/web",
  "framework": null,
  "rewrites": [
    { "source": "/(.*)", "destination": "/index.html" }
  ]
}
```

> If using the root-level `vercel.json` with a build command, you need to ensure Flutter is available in Vercel's build environment. For most cases, building locally and deploying the output is simpler.

#### Step 5: Verify

Open your Vercel URL (e.g., `https://ai-companions.vercel.app`). The app should load in your browser.

---

### Option B: Automated Build on Vercel (Advanced)

If you want Vercel to build Flutter automatically, you need a custom build setup:

1. Create `ai_companions_flutter/vercel.json`:

```json
{
  "buildCommand": "flutter build web --release",
  "outputDirectory": "build/web",
  "framework": null,
  "installCommand": "flutter pub get"
}
```

2. This requires Vercel to have Flutter SDK. You may need to use a **Docker-based build** or use a CI/CD pipeline (GitHub Actions) that builds and deploys the `build/web/` directory to Vercel.

For most users, **Option A** is simpler and sufficient.

---

## 4. Environment Variables Reference

### Backend (Render)

| Variable | Description | Example |
|---|---|---|
| `SUPABASE_URL` | Your Supabase project URL | `https://xxxx.supabase.co` |
| `SUPABASE_ANON_KEY` | Supabase anonymous/public key | `eyJ...` |
| `SUPABASE_SERVICE_ROLE_KEY` | Supabase service role key (secret) | `eyJ...` |
| `OPENAI_API_KEY` | OpenAI API key for AI responses | `sk-proj-...` |
| `PORT` | Server port (Render sets this automatically) | `3001` |
| `NODE_ENV` | Environment mode | `production` |

### Frontend (Flutter / Vercel)

| Variable | Description | Example |
|---|---|---|
| `EXPO_PUBLIC_API_URL` | Backend API base URL | `https://ai-companions-api.onrender.com/api/v1` |
| `EXPO_PUBLIC_SUPABASE_URL` | Supabase project URL | `https://xxxx.supabase.co` |
| `EXPO_PUBLIC_SUPABASE_ANON_KEY` | Supabase anonymous key | `eyJ...` |

> The Flutter `.env` file is bundled as a build-time asset. To change the API URL, you must rebuild the web app. Environment variables on Vercel do **not** affect Flutter web builds at runtime -- the values are baked in at build time.

---

## 5. Known Limitations

### SSE Streaming Does Not Work on Web

The chat streaming feature (`chat_service.dart`) uses `dart:io`'s `HttpClient`, which is **not available on web browsers**. On web, regular (non-streaming) chat messages will work, but real-time token-by-token streaming will not.

**Workaround:** To enable streaming on web, the `ChatService` would need a web-specific implementation using `dart:html`'s `HttpRequest` or a JavaScript interop call to the browser's `fetch` API with streaming reader. This is a code change, not a deployment configuration.

### `.env` Is a Build-Time Asset

`flutter_dotenv` loads `.env` from the Flutter asset bundle at startup. Changing environment variables requires a **full rebuild** of the web app. Unlike a server-side app, there is no way to swap env vars at runtime.

### CORS

The Express backend uses `app.use(cors())` with default settings, which allows **all origins**. This is fine for development and testing. For production, consider restricting CORS to your Vercel domain:

```typescript
app.use(cors({
  origin: ['https://ai-companions.vercel.app'],
  credentials: true,
}));
```

### Free Tier Limitations

- **Render Free Tier:** Instances spin down after 15 minutes of inactivity. Cold starts take 30-60 seconds.
- **Vercel Free Tier:** 100GB bandwidth/month, sufficient for testing.

---

## 6. Troubleshooting

### Backend won't start on Render

- Check the Render logs for missing environment variables. The server warns about missing vars but doesn't crash.
- Ensure `SUPABASE_URL`, `SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_ROLE_KEY`, and `OPENAI_API_KEY` are all set.
- The build must compile the `shared/` package first. The root `postinstall` script handles this.

### Flutter web build fails

- Run `flutter doctor` to verify your SDK version (>= 3.8.0).
- Run `flutter pub get` before building.
- If you see asset errors, ensure `assets/images/`, `assets/icons/`, `assets/animations/`, `assets/fonts/`, and `assets/translations/` directories exist (create empty ones if needed).

### App loads but API calls fail

- Open browser DevTools (F12) and check the Network tab.
- If you see CORS errors, the backend is blocking the request. Check the `cors()` configuration.
- If requests go to `localhost`, your `.env` was not updated before the build.
- Remember: `.env` values are baked in at build time. Rebuild after changing them.

### Vercel shows 404 on page refresh

- Add a `vercel.json` with rewrites to route all paths to `index.html` (SPA routing).

```json
{
  "rewrites": [
    { "source": "/(.*)", "destination": "/index.html" }
  ]
}
```

### Render deployment takes too long

- The first build installs all npm dependencies and compiles TypeScript. Subsequent builds use cache.
- Free tier: cold boot takes 30-60 seconds. Upgrade to Starter tier ($7/mo) for no cold starts.

---

## Quick Start Summary

```bash
# 1. Backend: Start locally
npm install && npm run build && npm run server:dev

# 2. Frontend: Run web locally
cd ai_companions_flutter
flutter pub get
flutter run -d chrome

# 3. Deploy backend to Render
#    - Create Web Service on render.com
#    - Build: npm install && npm run build
#    - Start: node dist/index.js
#    - Set env vars in dashboard

# 4. Deploy frontend to Vercel
#    - Update .env with Render backend URL
cd ai_companions_flutter
flutter build web --release
cd build/web
vercel --prod
```
