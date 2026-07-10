// Premium Service - Coins, Subscriptions, Image Generation

import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';
import '../../shared/models/index.dart';

class PremiumService {
  PremiumService._();

  static final instance = PremiumService._();

  Dio get _dio => DioClient.instance.dio;

  // Coins
  Future<int> getBalance() async {
    try {
      final response = await _dio.get('/premium/balance');
      final data = response.data['data'] as Map<String, dynamic>;
      return data['balance'] as int;
    } catch (e) {
      rethrow;
    }
  }

  Future<CoinTransaction> claimDailyBonus() async {
    try {
      final response = await _dio.post('/premium/daily-bonus');
      final data = response.data['data'] as Map<String, dynamic>;
      return CoinTransaction.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<PaginatedResponse<CoinTransaction>> getTransactions({int page = 1, int limit = 20}) async {
    try {
      final response = await _dio.get(
        '/premium/transactions',
        queryParameters: {'page': page, 'limit': limit},
      );
      return PaginatedResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => CoinTransaction.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      rethrow;
    }
  }

  // Subscriptions
  Future<Subscription> getSubscription() async {
    try {
      final response = await _dio.get('/premium/subscription');
      final data = response.data['data'] as Map<String, dynamic>;
      return Subscription.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<SubscriptionResponse> subscribe(String plan) async {
    try {
      final response = await _dio.post(
        '/premium/subscribe',
        data: {'plan': plan},
      );
      final data = response.data['data'] as Map<String, dynamic>;
      return SubscriptionResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> cancelSubscription() async {
    try {
      await _dio.post('/premium/cancel-subscription');
    } catch (e) {
      rethrow;
    }
  }

  // Image Generation
  Future<GenerationRequest> generateImage(String prompt, {String? style}) async {
    try {
      final response = await _dio.post(
        '/premium/generate',
        data: {
          'prompt': prompt,
          'style': style,
        },
      );
      final data = response.data['data'] as Map<String, dynamic>;
      return GenerationRequest.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<PaginatedResponse<GenerationRequest>> getGenerations({int page = 1, int limit = 20}) async {
    try {
      final response = await _dio.get(
        '/premium/generations',
        queryParameters: {'page': page, 'limit': limit},
      );
      return PaginatedResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => GenerationRequest.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<GenerationRequest> getGeneration(String id) async {
    try {
      final response = await _dio.get('/premium/generations/$id');
      final data = response.data['data'] as Map<String, dynamic>;
      return GenerationRequest.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}

