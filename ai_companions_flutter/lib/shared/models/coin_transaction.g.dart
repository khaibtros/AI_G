// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoinTransaction _$CoinTransactionFromJson(Map<String, dynamic> json) =>
    _CoinTransaction(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      amount: (json['amount'] as num).toInt(),
      balanceAfter: (json['balance_after'] as num).toInt(),
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
      description: json['description'] as String?,
      referenceId: json['reference_id'] as String?,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$CoinTransactionToJson(_CoinTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'amount': instance.amount,
      'balance_after': instance.balanceAfter,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'description': instance.description,
      'reference_id': instance.referenceId,
      'created_at': instance.createdAt,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.purchase: 'purchase',
  TransactionType.reward: 'reward',
  TransactionType.spend: 'spend',
  TransactionType.refund: 'refund',
  TransactionType.dailyBonus: 'dailyBonus',
};
