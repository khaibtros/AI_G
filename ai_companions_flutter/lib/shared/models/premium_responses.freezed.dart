// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premium_responses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscriptionResponse {

 Subscription get subscription;
/// Create a copy of SubscriptionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionResponseCopyWith<SubscriptionResponse> get copyWith => _$SubscriptionResponseCopyWithImpl<SubscriptionResponse>(this as SubscriptionResponse, _$identity);

  /// Serializes this SubscriptionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionResponse&&(identical(other.subscription, subscription) || other.subscription == subscription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subscription);

@override
String toString() {
  return 'SubscriptionResponse(subscription: $subscription)';
}


}

/// @nodoc
abstract mixin class $SubscriptionResponseCopyWith<$Res>  {
  factory $SubscriptionResponseCopyWith(SubscriptionResponse value, $Res Function(SubscriptionResponse) _then) = _$SubscriptionResponseCopyWithImpl;
@useResult
$Res call({
 Subscription subscription
});


$SubscriptionCopyWith<$Res> get subscription;

}
/// @nodoc
class _$SubscriptionResponseCopyWithImpl<$Res>
    implements $SubscriptionResponseCopyWith<$Res> {
  _$SubscriptionResponseCopyWithImpl(this._self, this._then);

  final SubscriptionResponse _self;
  final $Res Function(SubscriptionResponse) _then;

/// Create a copy of SubscriptionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subscription = null,}) {
  return _then(_self.copyWith(
subscription: null == subscription ? _self.subscription : subscription // ignore: cast_nullable_to_non_nullable
as Subscription,
  ));
}
/// Create a copy of SubscriptionResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubscriptionCopyWith<$Res> get subscription {
  
  return $SubscriptionCopyWith<$Res>(_self.subscription, (value) {
    return _then(_self.copyWith(subscription: value));
  });
}
}


/// Adds pattern-matching-related methods to [SubscriptionResponse].
extension SubscriptionResponsePatterns on SubscriptionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionResponse value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Subscription subscription)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionResponse() when $default != null:
return $default(_that.subscription);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Subscription subscription)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionResponse():
return $default(_that.subscription);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Subscription subscription)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionResponse() when $default != null:
return $default(_that.subscription);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubscriptionResponse implements SubscriptionResponse {
  const _SubscriptionResponse({required this.subscription});
  factory _SubscriptionResponse.fromJson(Map<String, dynamic> json) => _$SubscriptionResponseFromJson(json);

@override final  Subscription subscription;

/// Create a copy of SubscriptionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionResponseCopyWith<_SubscriptionResponse> get copyWith => __$SubscriptionResponseCopyWithImpl<_SubscriptionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionResponse&&(identical(other.subscription, subscription) || other.subscription == subscription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subscription);

@override
String toString() {
  return 'SubscriptionResponse(subscription: $subscription)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionResponseCopyWith<$Res> implements $SubscriptionResponseCopyWith<$Res> {
  factory _$SubscriptionResponseCopyWith(_SubscriptionResponse value, $Res Function(_SubscriptionResponse) _then) = __$SubscriptionResponseCopyWithImpl;
@override @useResult
$Res call({
 Subscription subscription
});


@override $SubscriptionCopyWith<$Res> get subscription;

}
/// @nodoc
class __$SubscriptionResponseCopyWithImpl<$Res>
    implements _$SubscriptionResponseCopyWith<$Res> {
  __$SubscriptionResponseCopyWithImpl(this._self, this._then);

  final _SubscriptionResponse _self;
  final $Res Function(_SubscriptionResponse) _then;

/// Create a copy of SubscriptionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subscription = null,}) {
  return _then(_SubscriptionResponse(
subscription: null == subscription ? _self.subscription : subscription // ignore: cast_nullable_to_non_nullable
as Subscription,
  ));
}

/// Create a copy of SubscriptionResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubscriptionCopyWith<$Res> get subscription {
  
  return $SubscriptionCopyWith<$Res>(_self.subscription, (value) {
    return _then(_self.copyWith(subscription: value));
  });
}
}

// dart format on
