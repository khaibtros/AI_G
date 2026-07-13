import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/register_screen.dart';
import '../../features/auth/screens/forgot_password_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/home/screens/tab_shell.dart';
import '../../features/chat/screens/chat_screen.dart';
import '../../features/shared/screens/discover_screen.dart';
import '../../features/chat/screens/chats_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/profile/screens/subscription_screen.dart';
import '../../features/profile/screens/settings_screen.dart';
import '../../features/profile/screens/my_characters_screen.dart';
import '../../features/character/screens/character_favorites_screen.dart';
import '../../features/character/screens/character_detail_screen.dart';
import '../../features/character/screens/character_create_screen.dart';
import '../../features/chat/screens/group_create_screen.dart';
import '../../features/admin/screens/admin_dashboard_screen.dart';
import '../../features/admin/screens/admin_transactions_screen.dart';
import '../../features/admin/screens/admin_settings_screen.dart';
import '../../features/auth/providers/auth_provider.dart';
import '../../features/premium/screens/coin_purchase_screen.dart';
import '../../features/premium/screens/image_generation_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final isAuthenticated = ref.watch(authProvider.select((s) => s.isAuthenticated));

  return GoRouter(
    initialLocation: isAuthenticated ? '/home' : '/login',
    redirect: (context, state) {
      final location = state.matchedLocation;

      final isAuthRoute = location == '/login' || location == '/register' || location == '/forgot-password';

      if (!isAuthenticated && !isAuthRoute) {
        return '/login';
      }
      if (isAuthenticated && isAuthRoute) {
        return '/home';
      }
      final user = ref.read(authProvider).user;
      if (isAuthenticated &&
          user?.isAdmin == true &&
          location == '/home') {
        return '/admin';
      }
      if (location.startsWith('/admin') && user?.isAdmin != true) {
        return '/home';
      }
      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            TabShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/discover',
                builder: (context, state) => const DiscoverScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/chats',
                builder: (context, state) => const ChatsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/chat/:conversationId',
        builder: (context, state) =>
            ChatScreen(conversationId: state.pathParameters['conversationId']!),
      ),
      GoRoute(
        path: '/character/create',
        builder: (context, state) => const CharacterCreateScreen(),
      ),
      GoRoute(
        path: '/character/favorites',
        builder: (context, state) => const CharacterFavoritesScreen(),
      ),
      GoRoute(
        path: '/character/my-characters',
        builder: (context, state) => const MyCharactersScreen(),
      ),
      GoRoute(
        path: '/character/:characterId',
        builder: (context, state) => CharacterDetailScreen(
          characterId: state.pathParameters['characterId']!,
        ),
      ),
      GoRoute(
        path: '/group/create',
        builder: (context, state) => const GroupCreateScreen(),
      ),
      GoRoute(
        path: '/subscription',
        builder: (context, state) => const SubscriptionScreen(),
      ),
      GoRoute(
        path: '/coins',
        builder: (context, state) => const CoinPurchaseScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/admin',
        builder: (context, state) => const AdminDashboardScreen(),
      ),
      GoRoute(
        path: '/admin/transactions',
        builder: (context, state) => const AdminTransactionsScreen(),
      ),
      GoRoute(
        path: '/admin/settings',
        builder: (context, state) => const AdminSettingsScreen(),
      ),
      GoRoute(
        path: '/generate',
        builder: (context, state) => const ImageGenerationScreen(),
      ),
    ],
  );
});
