// Premium Provider - Riverpod state management for premium features

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/premium_service.dart';
import '../../../shared/models/index.dart';
import '../../auth/providers/auth_provider.dart';

class PremiumState {
  final Subscription? subscription;
  final List<CoinTransaction> transactions;
  final bool isLoading;
  final String? error;

  PremiumState({
    this.subscription,
    this.transactions = const [],
    this.isLoading = false,
    this.error,
  });

  PremiumState copyWith({
    Subscription? subscription,
    List<CoinTransaction>? transactions,
    bool? isLoading,
    String? error,
  }) {
    return PremiumState(
      subscription: subscription ?? this.subscription,
      transactions: transactions ?? this.transactions,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class PremiumNotifier extends Notifier<PremiumState> {
  @override
  PremiumState build() => PremiumState();

  Future<void> getSubscription() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final sub = await PremiumService.instance.getSubscription();
      state = state.copyWith(subscription: sub, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      rethrow;
    }
  }

  Future<void> getTransactions() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await PremiumService.instance.getTransactions();
      state = state.copyWith(transactions: result.data, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      rethrow;
    }
  }

  Future<void> subscribe(String plan) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await PremiumService.instance.subscribe(plan);
      state = state.copyWith(
        subscription: result.subscription,
        isLoading: false,
      );
      ref
          .read(authProvider.notifier)
          .loadProfile(); // Refresh user profile to update subscription tier
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      rethrow;
    }
  }

  Future<void> cancelSubscription() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await PremiumService.instance.cancelSubscription();
      await getSubscription(); // Refresh subscription status
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      rethrow;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> claimDailyBonus() async {
    try {
      final transaction = await PremiumService.instance.claimDailyBonus();
      ref.read(authProvider.notifier).updateBalance(transaction.balanceAfter);
    } catch (e) {
      rethrow;
    }
  }
}

final premiumProvider = NotifierProvider<PremiumNotifier, PremiumState>(
  PremiumNotifier.new,
);
