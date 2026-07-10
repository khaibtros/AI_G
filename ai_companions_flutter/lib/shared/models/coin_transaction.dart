// Coin Transaction Model

import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';

part 'coin_transaction.freezed.dart';
part 'coin_transaction.g.dart';

@freezed
abstract class CoinTransaction with _$CoinTransaction {
  const factory CoinTransaction({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required int amount,
    @JsonKey(name: 'balance_after') required int balanceAfter,
    required TransactionType type,
    String? description,
    @JsonKey(name: 'reference_id') String? referenceId,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _CoinTransaction;

  factory CoinTransaction.fromJson(Map<String, dynamic> json) =>
      _$CoinTransactionFromJson(json);
}
