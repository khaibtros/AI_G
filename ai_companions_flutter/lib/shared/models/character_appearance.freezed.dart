// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_appearance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharacterAppearance {

@JsonKey(name: 'hair_color') String? get hairColor;@JsonKey(name: 'eye_color') String? get eyeColor;@JsonKey(name: 'body_type') String? get bodyType; String? get outfit;@JsonKey(name: 'distinguishing_features') String? get distinguishingFeatures;@JsonKey(name: 'age_appearance') String? get ageAppearance;
/// Create a copy of CharacterAppearance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterAppearanceCopyWith<CharacterAppearance> get copyWith => _$CharacterAppearanceCopyWithImpl<CharacterAppearance>(this as CharacterAppearance, _$identity);

  /// Serializes this CharacterAppearance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterAppearance&&(identical(other.hairColor, hairColor) || other.hairColor == hairColor)&&(identical(other.eyeColor, eyeColor) || other.eyeColor == eyeColor)&&(identical(other.bodyType, bodyType) || other.bodyType == bodyType)&&(identical(other.outfit, outfit) || other.outfit == outfit)&&(identical(other.distinguishingFeatures, distinguishingFeatures) || other.distinguishingFeatures == distinguishingFeatures)&&(identical(other.ageAppearance, ageAppearance) || other.ageAppearance == ageAppearance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hairColor,eyeColor,bodyType,outfit,distinguishingFeatures,ageAppearance);

@override
String toString() {
  return 'CharacterAppearance(hairColor: $hairColor, eyeColor: $eyeColor, bodyType: $bodyType, outfit: $outfit, distinguishingFeatures: $distinguishingFeatures, ageAppearance: $ageAppearance)';
}


}

/// @nodoc
abstract mixin class $CharacterAppearanceCopyWith<$Res>  {
  factory $CharacterAppearanceCopyWith(CharacterAppearance value, $Res Function(CharacterAppearance) _then) = _$CharacterAppearanceCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'hair_color') String? hairColor,@JsonKey(name: 'eye_color') String? eyeColor,@JsonKey(name: 'body_type') String? bodyType, String? outfit,@JsonKey(name: 'distinguishing_features') String? distinguishingFeatures,@JsonKey(name: 'age_appearance') String? ageAppearance
});




}
/// @nodoc
class _$CharacterAppearanceCopyWithImpl<$Res>
    implements $CharacterAppearanceCopyWith<$Res> {
  _$CharacterAppearanceCopyWithImpl(this._self, this._then);

  final CharacterAppearance _self;
  final $Res Function(CharacterAppearance) _then;

/// Create a copy of CharacterAppearance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hairColor = freezed,Object? eyeColor = freezed,Object? bodyType = freezed,Object? outfit = freezed,Object? distinguishingFeatures = freezed,Object? ageAppearance = freezed,}) {
  return _then(_self.copyWith(
hairColor: freezed == hairColor ? _self.hairColor : hairColor // ignore: cast_nullable_to_non_nullable
as String?,eyeColor: freezed == eyeColor ? _self.eyeColor : eyeColor // ignore: cast_nullable_to_non_nullable
as String?,bodyType: freezed == bodyType ? _self.bodyType : bodyType // ignore: cast_nullable_to_non_nullable
as String?,outfit: freezed == outfit ? _self.outfit : outfit // ignore: cast_nullable_to_non_nullable
as String?,distinguishingFeatures: freezed == distinguishingFeatures ? _self.distinguishingFeatures : distinguishingFeatures // ignore: cast_nullable_to_non_nullable
as String?,ageAppearance: freezed == ageAppearance ? _self.ageAppearance : ageAppearance // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CharacterAppearance].
extension CharacterAppearancePatterns on CharacterAppearance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharacterAppearance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharacterAppearance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharacterAppearance value)  $default,){
final _that = this;
switch (_that) {
case _CharacterAppearance():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharacterAppearance value)?  $default,){
final _that = this;
switch (_that) {
case _CharacterAppearance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'hair_color')  String? hairColor, @JsonKey(name: 'eye_color')  String? eyeColor, @JsonKey(name: 'body_type')  String? bodyType,  String? outfit, @JsonKey(name: 'distinguishing_features')  String? distinguishingFeatures, @JsonKey(name: 'age_appearance')  String? ageAppearance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharacterAppearance() when $default != null:
return $default(_that.hairColor,_that.eyeColor,_that.bodyType,_that.outfit,_that.distinguishingFeatures,_that.ageAppearance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'hair_color')  String? hairColor, @JsonKey(name: 'eye_color')  String? eyeColor, @JsonKey(name: 'body_type')  String? bodyType,  String? outfit, @JsonKey(name: 'distinguishing_features')  String? distinguishingFeatures, @JsonKey(name: 'age_appearance')  String? ageAppearance)  $default,) {final _that = this;
switch (_that) {
case _CharacterAppearance():
return $default(_that.hairColor,_that.eyeColor,_that.bodyType,_that.outfit,_that.distinguishingFeatures,_that.ageAppearance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'hair_color')  String? hairColor, @JsonKey(name: 'eye_color')  String? eyeColor, @JsonKey(name: 'body_type')  String? bodyType,  String? outfit, @JsonKey(name: 'distinguishing_features')  String? distinguishingFeatures, @JsonKey(name: 'age_appearance')  String? ageAppearance)?  $default,) {final _that = this;
switch (_that) {
case _CharacterAppearance() when $default != null:
return $default(_that.hairColor,_that.eyeColor,_that.bodyType,_that.outfit,_that.distinguishingFeatures,_that.ageAppearance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CharacterAppearance implements CharacterAppearance {
  const _CharacterAppearance({@JsonKey(name: 'hair_color') this.hairColor, @JsonKey(name: 'eye_color') this.eyeColor, @JsonKey(name: 'body_type') this.bodyType, this.outfit, @JsonKey(name: 'distinguishing_features') this.distinguishingFeatures, @JsonKey(name: 'age_appearance') this.ageAppearance});
  factory _CharacterAppearance.fromJson(Map<String, dynamic> json) => _$CharacterAppearanceFromJson(json);

@override@JsonKey(name: 'hair_color') final  String? hairColor;
@override@JsonKey(name: 'eye_color') final  String? eyeColor;
@override@JsonKey(name: 'body_type') final  String? bodyType;
@override final  String? outfit;
@override@JsonKey(name: 'distinguishing_features') final  String? distinguishingFeatures;
@override@JsonKey(name: 'age_appearance') final  String? ageAppearance;

/// Create a copy of CharacterAppearance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterAppearanceCopyWith<_CharacterAppearance> get copyWith => __$CharacterAppearanceCopyWithImpl<_CharacterAppearance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CharacterAppearanceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterAppearance&&(identical(other.hairColor, hairColor) || other.hairColor == hairColor)&&(identical(other.eyeColor, eyeColor) || other.eyeColor == eyeColor)&&(identical(other.bodyType, bodyType) || other.bodyType == bodyType)&&(identical(other.outfit, outfit) || other.outfit == outfit)&&(identical(other.distinguishingFeatures, distinguishingFeatures) || other.distinguishingFeatures == distinguishingFeatures)&&(identical(other.ageAppearance, ageAppearance) || other.ageAppearance == ageAppearance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hairColor,eyeColor,bodyType,outfit,distinguishingFeatures,ageAppearance);

@override
String toString() {
  return 'CharacterAppearance(hairColor: $hairColor, eyeColor: $eyeColor, bodyType: $bodyType, outfit: $outfit, distinguishingFeatures: $distinguishingFeatures, ageAppearance: $ageAppearance)';
}


}

/// @nodoc
abstract mixin class _$CharacterAppearanceCopyWith<$Res> implements $CharacterAppearanceCopyWith<$Res> {
  factory _$CharacterAppearanceCopyWith(_CharacterAppearance value, $Res Function(_CharacterAppearance) _then) = __$CharacterAppearanceCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'hair_color') String? hairColor,@JsonKey(name: 'eye_color') String? eyeColor,@JsonKey(name: 'body_type') String? bodyType, String? outfit,@JsonKey(name: 'distinguishing_features') String? distinguishingFeatures,@JsonKey(name: 'age_appearance') String? ageAppearance
});




}
/// @nodoc
class __$CharacterAppearanceCopyWithImpl<$Res>
    implements _$CharacterAppearanceCopyWith<$Res> {
  __$CharacterAppearanceCopyWithImpl(this._self, this._then);

  final _CharacterAppearance _self;
  final $Res Function(_CharacterAppearance) _then;

/// Create a copy of CharacterAppearance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hairColor = freezed,Object? eyeColor = freezed,Object? bodyType = freezed,Object? outfit = freezed,Object? distinguishingFeatures = freezed,Object? ageAppearance = freezed,}) {
  return _then(_CharacterAppearance(
hairColor: freezed == hairColor ? _self.hairColor : hairColor // ignore: cast_nullable_to_non_nullable
as String?,eyeColor: freezed == eyeColor ? _self.eyeColor : eyeColor // ignore: cast_nullable_to_non_nullable
as String?,bodyType: freezed == bodyType ? _self.bodyType : bodyType // ignore: cast_nullable_to_non_nullable
as String?,outfit: freezed == outfit ? _self.outfit : outfit // ignore: cast_nullable_to_non_nullable
as String?,distinguishingFeatures: freezed == distinguishingFeatures ? _self.distinguishingFeatures : distinguishingFeatures // ignore: cast_nullable_to_non_nullable
as String?,ageAppearance: freezed == ageAppearance ? _self.ageAppearance : ageAppearance // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
