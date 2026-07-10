// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoinTransaction {

 String get id;@JsonKey(name: 'user_id') String get userId; int get amount;@JsonKey(name: 'balance_after') int get balanceAfter; TransactionType get type; String? get description;@JsonKey(name: 'reference_id') String? get referenceId;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of CoinTransaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinTransactionCopyWith<CoinTransaction> get copyWith => _$CoinTransactionCopyWithImpl<CoinTransaction>(this as CoinTransaction, _$identity);

  /// Serializes this CoinTransaction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinTransaction&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.balanceAfter, balanceAfter) || other.balanceAfter == balanceAfter)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,amount,balanceAfter,type,description,referenceId,createdAt);

@override
String toString() {
  return 'CoinTransaction(id: $id, userId: $userId, amount: $amount, balanceAfter: $balanceAfter, type: $type, description: $description, referenceId: $referenceId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CoinTransactionCopyWith<$Res>  {
  factory $CoinTransactionCopyWith(CoinTransaction value, $Res Function(CoinTransaction) _then) = _$CoinTransactionCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId, int amount,@JsonKey(name: 'balance_after') int balanceAfter, TransactionType type, String? description,@JsonKey(name: 'reference_id') String? referenceId,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$CoinTransactionCopyWithImpl<$Res>
    implements $CoinTransactionCopyWith<$Res> {
  _$CoinTransactionCopyWithImpl(this._self, this._then);

  final CoinTransaction _self;
  final $Res Function(CoinTransaction) _then;

/// Create a copy of CoinTransaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? amount = null,Object? balanceAfter = null,Object? type = null,Object? description = freezed,Object? referenceId = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,balanceAfter: null == balanceAfter ? _self.balanceAfter : balanceAfter // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CoinTransaction].
extension CoinTransactionPatterns on CoinTransaction {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoinTransaction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoinTransaction() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoinTransaction value)  $default,){
final _that = this;
switch (_that) {
case _CoinTransaction():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoinTransaction value)?  $default,){
final _that = this;
switch (_that) {
case _CoinTransaction() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId,  int amount, @JsonKey(name: 'balance_after')  int balanceAfter,  TransactionType type,  String? description, @JsonKey(name: 'reference_id')  String? referenceId, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoinTransaction() when $default != null:
return $default(_that.id,_that.userId,_that.amount,_that.balanceAfter,_that.type,_that.description,_that.referenceId,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId,  int amount, @JsonKey(name: 'balance_after')  int balanceAfter,  TransactionType type,  String? description, @JsonKey(name: 'reference_id')  String? referenceId, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _CoinTransaction():
return $default(_that.id,_that.userId,_that.amount,_that.balanceAfter,_that.type,_that.description,_that.referenceId,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId,  int amount, @JsonKey(name: 'balance_after')  int balanceAfter,  TransactionType type,  String? description, @JsonKey(name: 'reference_id')  String? referenceId, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CoinTransaction() when $default != null:
return $default(_that.id,_that.userId,_that.amount,_that.balanceAfter,_that.type,_that.description,_that.referenceId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoinTransaction implements CoinTransaction {
  const _CoinTransaction({required this.id, @JsonKey(name: 'user_id') required this.userId, required this.amount, @JsonKey(name: 'balance_after') required this.balanceAfter, required this.type, this.description, @JsonKey(name: 'reference_id') this.referenceId, @JsonKey(name: 'created_at') required this.createdAt});
  factory _CoinTransaction.fromJson(Map<String, dynamic> json) => _$CoinTransactionFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override final  int amount;
@override@JsonKey(name: 'balance_after') final  int balanceAfter;
@override final  TransactionType type;
@override final  String? description;
@override@JsonKey(name: 'reference_id') final  String? referenceId;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of CoinTransaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinTransactionCopyWith<_CoinTransaction> get copyWith => __$CoinTransactionCopyWithImpl<_CoinTransaction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoinTransactionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoinTransaction&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.balanceAfter, balanceAfter) || other.balanceAfter == balanceAfter)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,amount,balanceAfter,type,description,referenceId,createdAt);

@override
String toString() {
  return 'CoinTransaction(id: $id, userId: $userId, amount: $amount, balanceAfter: $balanceAfter, type: $type, description: $description, referenceId: $referenceId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CoinTransactionCopyWith<$Res> implements $CoinTransactionCopyWith<$Res> {
  factory _$CoinTransactionCopyWith(_CoinTransaction value, $Res Function(_CoinTransaction) _then) = __$CoinTransactionCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId, int amount,@JsonKey(name: 'balance_after') int balanceAfter, TransactionType type, String? description,@JsonKey(name: 'reference_id') String? referenceId,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$CoinTransactionCopyWithImpl<$Res>
    implements _$CoinTransactionCopyWith<$Res> {
  __$CoinTransactionCopyWithImpl(this._self, this._then);

  final _CoinTransaction _self;
  final $Res Function(_CoinTransaction) _then;

/// Create a copy of CoinTransaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? amount = null,Object? balanceAfter = null,Object? type = null,Object? description = freezed,Object? referenceId = freezed,Object? createdAt = null,}) {
  return _then(_CoinTransaction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,balanceAfter: null == balanceAfter ? _self.balanceAfter : balanceAfter // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
