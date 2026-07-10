// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Profile {

 String get id; String? get username;@JsonKey(name: 'display_name') String? get displayName;@JsonKey(name: 'avatar_url') String? get avatarUrl; String? get bio;@JsonKey(name: 'coin_balance') int get coinBalance;@JsonKey(name: 'subscription_tier') SubscriptionTier get subscriptionTier;@JsonKey(name: 'daily_message_count') int get dailyMessageCount;@JsonKey(name: 'last_message_reset_at') String get lastMessageResetAt;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;@JsonKey(name: 'is_admin') bool get isAdmin;
/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileCopyWith<Profile> get copyWith => _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Profile&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.coinBalance, coinBalance) || other.coinBalance == coinBalance)&&(identical(other.subscriptionTier, subscriptionTier) || other.subscriptionTier == subscriptionTier)&&(identical(other.dailyMessageCount, dailyMessageCount) || other.dailyMessageCount == dailyMessageCount)&&(identical(other.lastMessageResetAt, lastMessageResetAt) || other.lastMessageResetAt == lastMessageResetAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,displayName,avatarUrl,bio,coinBalance,subscriptionTier,dailyMessageCount,lastMessageResetAt,createdAt,updatedAt,isAdmin);

@override
String toString() {
  return 'Profile(id: $id, username: $username, displayName: $displayName, avatarUrl: $avatarUrl, bio: $bio, coinBalance: $coinBalance, subscriptionTier: $subscriptionTier, dailyMessageCount: $dailyMessageCount, lastMessageResetAt: $lastMessageResetAt, createdAt: $createdAt, updatedAt: $updatedAt, isAdmin: $isAdmin)';
}


}

/// @nodoc
abstract mixin class $ProfileCopyWith<$Res>  {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) _then) = _$ProfileCopyWithImpl;
@useResult
$Res call({
 String id, String? username,@JsonKey(name: 'display_name') String? displayName,@JsonKey(name: 'avatar_url') String? avatarUrl, String? bio,@JsonKey(name: 'coin_balance') int coinBalance,@JsonKey(name: 'subscription_tier') SubscriptionTier subscriptionTier,@JsonKey(name: 'daily_message_count') int dailyMessageCount,@JsonKey(name: 'last_message_reset_at') String lastMessageResetAt,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'is_admin') bool isAdmin
});




}
/// @nodoc
class _$ProfileCopyWithImpl<$Res>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._self, this._then);

  final Profile _self;
  final $Res Function(Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = freezed,Object? displayName = freezed,Object? avatarUrl = freezed,Object? bio = freezed,Object? coinBalance = null,Object? subscriptionTier = null,Object? dailyMessageCount = null,Object? lastMessageResetAt = null,Object? createdAt = null,Object? updatedAt = null,Object? isAdmin = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,coinBalance: null == coinBalance ? _self.coinBalance : coinBalance // ignore: cast_nullable_to_non_nullable
as int,subscriptionTier: null == subscriptionTier ? _self.subscriptionTier : subscriptionTier // ignore: cast_nullable_to_non_nullable
as SubscriptionTier,dailyMessageCount: null == dailyMessageCount ? _self.dailyMessageCount : dailyMessageCount // ignore: cast_nullable_to_non_nullable
as int,lastMessageResetAt: null == lastMessageResetAt ? _self.lastMessageResetAt : lastMessageResetAt // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Profile].
extension ProfilePatterns on Profile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Profile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Profile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Profile value)  $default,){
final _that = this;
switch (_that) {
case _Profile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Profile value)?  $default,){
final _that = this;
switch (_that) {
case _Profile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? username, @JsonKey(name: 'display_name')  String? displayName, @JsonKey(name: 'avatar_url')  String? avatarUrl,  String? bio, @JsonKey(name: 'coin_balance')  int coinBalance, @JsonKey(name: 'subscription_tier')  SubscriptionTier subscriptionTier, @JsonKey(name: 'daily_message_count')  int dailyMessageCount, @JsonKey(name: 'last_message_reset_at')  String lastMessageResetAt, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'is_admin')  bool isAdmin)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that.id,_that.username,_that.displayName,_that.avatarUrl,_that.bio,_that.coinBalance,_that.subscriptionTier,_that.dailyMessageCount,_that.lastMessageResetAt,_that.createdAt,_that.updatedAt,_that.isAdmin);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? username, @JsonKey(name: 'display_name')  String? displayName, @JsonKey(name: 'avatar_url')  String? avatarUrl,  String? bio, @JsonKey(name: 'coin_balance')  int coinBalance, @JsonKey(name: 'subscription_tier')  SubscriptionTier subscriptionTier, @JsonKey(name: 'daily_message_count')  int dailyMessageCount, @JsonKey(name: 'last_message_reset_at')  String lastMessageResetAt, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'is_admin')  bool isAdmin)  $default,) {final _that = this;
switch (_that) {
case _Profile():
return $default(_that.id,_that.username,_that.displayName,_that.avatarUrl,_that.bio,_that.coinBalance,_that.subscriptionTier,_that.dailyMessageCount,_that.lastMessageResetAt,_that.createdAt,_that.updatedAt,_that.isAdmin);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? username, @JsonKey(name: 'display_name')  String? displayName, @JsonKey(name: 'avatar_url')  String? avatarUrl,  String? bio, @JsonKey(name: 'coin_balance')  int coinBalance, @JsonKey(name: 'subscription_tier')  SubscriptionTier subscriptionTier, @JsonKey(name: 'daily_message_count')  int dailyMessageCount, @JsonKey(name: 'last_message_reset_at')  String lastMessageResetAt, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'is_admin')  bool isAdmin)?  $default,) {final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that.id,_that.username,_that.displayName,_that.avatarUrl,_that.bio,_that.coinBalance,_that.subscriptionTier,_that.dailyMessageCount,_that.lastMessageResetAt,_that.createdAt,_that.updatedAt,_that.isAdmin);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Profile implements Profile {
  const _Profile({required this.id, this.username, @JsonKey(name: 'display_name') this.displayName, @JsonKey(name: 'avatar_url') this.avatarUrl, this.bio, @JsonKey(name: 'coin_balance') this.coinBalance = 0, @JsonKey(name: 'subscription_tier') this.subscriptionTier = SubscriptionTier.free, @JsonKey(name: 'daily_message_count') this.dailyMessageCount = 0, @JsonKey(name: 'last_message_reset_at') required this.lastMessageResetAt, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'is_admin') this.isAdmin = false});
  factory _Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

@override final  String id;
@override final  String? username;
@override@JsonKey(name: 'display_name') final  String? displayName;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override final  String? bio;
@override@JsonKey(name: 'coin_balance') final  int coinBalance;
@override@JsonKey(name: 'subscription_tier') final  SubscriptionTier subscriptionTier;
@override@JsonKey(name: 'daily_message_count') final  int dailyMessageCount;
@override@JsonKey(name: 'last_message_reset_at') final  String lastMessageResetAt;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override@JsonKey(name: 'is_admin') final  bool isAdmin;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileCopyWith<_Profile> get copyWith => __$ProfileCopyWithImpl<_Profile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Profile&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.coinBalance, coinBalance) || other.coinBalance == coinBalance)&&(identical(other.subscriptionTier, subscriptionTier) || other.subscriptionTier == subscriptionTier)&&(identical(other.dailyMessageCount, dailyMessageCount) || other.dailyMessageCount == dailyMessageCount)&&(identical(other.lastMessageResetAt, lastMessageResetAt) || other.lastMessageResetAt == lastMessageResetAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,displayName,avatarUrl,bio,coinBalance,subscriptionTier,dailyMessageCount,lastMessageResetAt,createdAt,updatedAt,isAdmin);

@override
String toString() {
  return 'Profile(id: $id, username: $username, displayName: $displayName, avatarUrl: $avatarUrl, bio: $bio, coinBalance: $coinBalance, subscriptionTier: $subscriptionTier, dailyMessageCount: $dailyMessageCount, lastMessageResetAt: $lastMessageResetAt, createdAt: $createdAt, updatedAt: $updatedAt, isAdmin: $isAdmin)';
}


}

/// @nodoc
abstract mixin class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) _then) = __$ProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String? username,@JsonKey(name: 'display_name') String? displayName,@JsonKey(name: 'avatar_url') String? avatarUrl, String? bio,@JsonKey(name: 'coin_balance') int coinBalance,@JsonKey(name: 'subscription_tier') SubscriptionTier subscriptionTier,@JsonKey(name: 'daily_message_count') int dailyMessageCount,@JsonKey(name: 'last_message_reset_at') String lastMessageResetAt,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'is_admin') bool isAdmin
});




}
/// @nodoc
class __$ProfileCopyWithImpl<$Res>
    implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(this._self, this._then);

  final _Profile _self;
  final $Res Function(_Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = freezed,Object? displayName = freezed,Object? avatarUrl = freezed,Object? bio = freezed,Object? coinBalance = null,Object? subscriptionTier = null,Object? dailyMessageCount = null,Object? lastMessageResetAt = null,Object? createdAt = null,Object? updatedAt = null,Object? isAdmin = null,}) {
  return _then(_Profile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,coinBalance: null == coinBalance ? _self.coinBalance : coinBalance // ignore: cast_nullable_to_non_nullable
as int,subscriptionTier: null == subscriptionTier ? _self.subscriptionTier : subscriptionTier // ignore: cast_nullable_to_non_nullable
as SubscriptionTier,dailyMessageCount: null == dailyMessageCount ? _self.dailyMessageCount : dailyMessageCount // ignore: cast_nullable_to_non_nullable
as int,lastMessageResetAt: null == lastMessageResetAt ? _self.lastMessageResetAt : lastMessageResetAt // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
