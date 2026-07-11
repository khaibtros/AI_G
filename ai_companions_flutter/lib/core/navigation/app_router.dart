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
import '../../features/admin/screens/admin_users_screen.dart';
import '../../features/character/screens/character_detail_screen.dart';
import '../../features/character/screens/character_create_screen.dart';
import '../../features/chat/screens/group_create_screen.dart';
import '../../features/admin/screens/admin_dashboard_screen.dart';
import '../../features/admin/screens/admin_characters_screen.dart';
import '../../features/auth/providers/auth_provider.dart';
import '../../features/premium/screens/coin_purchase_screen.dart';
import '../../features/premium/screens/image_generation_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);
  final isAuthenticated = authState.isAuthenticated;

  return GoRouter(
    initialLocation: isAuthenticated ? '/home' : '/login',
    redirect: (context, state) {
      final location = state.matchedLocation;

      if (!isAuthenticated && location != '/login' && location != '/register') {
        return '/login';
      }
      if (isAuthenticated && location == '/login') {
        return '/home';
      }
      if (isAuthenticated &&
          authState.user?.isAdmin == true &&
          location == '/home') {
        return '/admin';
      }
      if (location.startsWith('/admin') && authState.user?.isAdmin != true) {
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
        path: '/character/:characterId',
        builder: (context, state) => CharacterDetailScreen(
          characterId: state.pathParameters['characterId']!,
        ),
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
        path: '/admin/users',
        builder: (context, state) => const AdminUsersScreen(),
      ),
      GoRoute(
        path: '/admin/characters',
        builder: (context, state) => const AdminCharactersScreen(),
      ),
      GoRoute(
        path: '/generate',
        builder: (context, state) => const ImageGenerationScreen(),
      ),
    ],
  );
});
