// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_personality.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharacterPersonality {

 List<String>? get traits; List<String>? get interests;@JsonKey(name: 'communication_style') String? get communicationStyle; String? get backstory; List<String>? get quirks; List<String>? get likes; List<String>? get dislikes;@JsonKey(name: 'speaking_tone') String? get speakingTone;
/// Create a copy of CharacterPersonality
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterPersonalityCopyWith<CharacterPersonality> get copyWith => _$CharacterPersonalityCopyWithImpl<CharacterPersonality>(this as CharacterPersonality, _$identity);

  /// Serializes this CharacterPersonality to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterPersonality&&const DeepCollectionEquality().equals(other.traits, traits)&&const DeepCollectionEquality().equals(other.interests, interests)&&(identical(other.communicationStyle, communicationStyle) || other.communicationStyle == communicationStyle)&&(identical(other.backstory, backstory) || other.backstory == backstory)&&const DeepCollectionEquality().equals(other.quirks, quirks)&&const DeepCollectionEquality().equals(other.likes, likes)&&const DeepCollectionEquality().equals(other.dislikes, dislikes)&&(identical(other.speakingTone, speakingTone) || other.speakingTone == speakingTone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(traits),const DeepCollectionEquality().hash(interests),communicationStyle,backstory,const DeepCollectionEquality().hash(quirks),const DeepCollectionEquality().hash(likes),const DeepCollectionEquality().hash(dislikes),speakingTone);

@override
String toString() {
  return 'CharacterPersonality(traits: $traits, interests: $interests, communicationStyle: $communicationStyle, backstory: $backstory, quirks: $quirks, likes: $likes, dislikes: $dislikes, speakingTone: $speakingTone)';
}


}

/// @nodoc
abstract mixin class $CharacterPersonalityCopyWith<$Res>  {
  factory $CharacterPersonalityCopyWith(CharacterPersonality value, $Res Function(CharacterPersonality) _then) = _$CharacterPersonalityCopyWithImpl;
@useResult
$Res call({
 List<String>? traits, List<String>? interests,@JsonKey(name: 'communication_style') String? communicationStyle, String? backstory, List<String>? quirks, List<String>? likes, List<String>? dislikes,@JsonKey(name: 'speaking_tone') String? speakingTone
});




}
/// @nodoc
class _$CharacterPersonalityCopyWithImpl<$Res>
    implements $CharacterPersonalityCopyWith<$Res> {
  _$CharacterPersonalityCopyWithImpl(this._self, this._then);

  final CharacterPersonality _self;
  final $Res Function(CharacterPersonality) _then;

/// Create a copy of CharacterPersonality
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? traits = freezed,Object? interests = freezed,Object? communicationStyle = freezed,Object? backstory = freezed,Object? quirks = freezed,Object? likes = freezed,Object? dislikes = freezed,Object? speakingTone = freezed,}) {
  return _then(_self.copyWith(
traits: freezed == traits ? _self.traits : traits // ignore: cast_nullable_to_non_nullable
as List<String>?,interests: freezed == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>?,communicationStyle: freezed == communicationStyle ? _self.communicationStyle : communicationStyle // ignore: cast_nullable_to_non_nullable
as String?,backstory: freezed == backstory ? _self.backstory : backstory // ignore: cast_nullable_to_non_nullable
as String?,quirks: freezed == quirks ? _self.quirks : quirks // ignore: cast_nullable_to_non_nullable
as List<String>?,likes: freezed == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as List<String>?,dislikes: freezed == dislikes ? _self.dislikes : dislikes // ignore: cast_nullable_to_non_nullable
as List<String>?,speakingTone: freezed == speakingTone ? _self.speakingTone : speakingTone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CharacterPersonality].
extension CharacterPersonalityPatterns on CharacterPersonality {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharacterPersonality value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharacterPersonality() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharacterPersonality value)  $default,){
final _that = this;
switch (_that) {
case _CharacterPersonality():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharacterPersonality value)?  $default,){
final _that = this;
switch (_that) {
case _CharacterPersonality() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String>? traits,  List<String>? interests, @JsonKey(name: 'communication_style')  String? communicationStyle,  String? backstory,  List<String>? quirks,  List<String>? likes,  List<String>? dislikes, @JsonKey(name: 'speaking_tone')  String? speakingTone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharacterPersonality() when $default != null:
return $default(_that.traits,_that.interests,_that.communicationStyle,_that.backstory,_that.quirks,_that.likes,_that.dislikes,_that.speakingTone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String>? traits,  List<String>? interests, @JsonKey(name: 'communication_style')  String? communicationStyle,  String? backstory,  List<String>? quirks,  List<String>? likes,  List<String>? dislikes, @JsonKey(name: 'speaking_tone')  String? speakingTone)  $default,) {final _that = this;
switch (_that) {
case _CharacterPersonality():
return $default(_that.traits,_that.interests,_that.communicationStyle,_that.backstory,_that.quirks,_that.likes,_that.dislikes,_that.speakingTone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String>? traits,  List<String>? interests, @JsonKey(name: 'communication_style')  String? communicationStyle,  String? backstory,  List<String>? quirks,  List<String>? likes,  List<String>? dislikes, @JsonKey(name: 'speaking_tone')  String? speakingTone)?  $default,) {final _that = this;
switch (_that) {
case _CharacterPersonality() when $default != null:
return $default(_that.traits,_that.interests,_that.communicationStyle,_that.backstory,_that.quirks,_that.likes,_that.dislikes,_that.speakingTone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CharacterPersonality implements CharacterPersonality {
  const _CharacterPersonality({final  List<String>? traits, final  List<String>? interests, @JsonKey(name: 'communication_style') this.communicationStyle, this.backstory, final  List<String>? quirks, final  List<String>? likes, final  List<String>? dislikes, @JsonKey(name: 'speaking_tone') this.speakingTone}): _traits = traits,_interests = interests,_quirks = quirks,_likes = likes,_dislikes = dislikes;
  factory _CharacterPersonality.fromJson(Map<String, dynamic> json) => _$CharacterPersonalityFromJson(json);

 final  List<String>? _traits;
@override List<String>? get traits {
  final value = _traits;
  if (value == null) return null;
  if (_traits is EqualUnmodifiableListView) return _traits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _interests;
@override List<String>? get interests {
  final value = _interests;
  if (value == null) return null;
  if (_interests is EqualUnmodifiableListView) return _interests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'communication_style') final  String? communicationStyle;
@override final  String? backstory;
 final  List<String>? _quirks;
@override List<String>? get quirks {
  final value = _quirks;
  if (value == null) return null;
  if (_quirks is EqualUnmodifiableListView) return _quirks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _likes;
@override List<String>? get likes {
  final value = _likes;
  if (value == null) return null;
  if (_likes is EqualUnmodifiableListView) return _likes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _dislikes;
@override List<String>? get dislikes {
  final value = _dislikes;
  if (value == null) return null;
  if (_dislikes is EqualUnmodifiableListView) return _dislikes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'speaking_tone') final  String? speakingTone;

/// Create a copy of CharacterPersonality
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterPersonalityCopyWith<_CharacterPersonality> get copyWith => __$CharacterPersonalityCopyWithImpl<_CharacterPersonality>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CharacterPersonalityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterPersonality&&const DeepCollectionEquality().equals(other._traits, _traits)&&const DeepCollectionEquality().equals(other._interests, _interests)&&(identical(other.communicationStyle, communicationStyle) || other.communicationStyle == communicationStyle)&&(identical(other.backstory, backstory) || other.backstory == backstory)&&const DeepCollectionEquality().equals(other._quirks, _quirks)&&const DeepCollectionEquality().equals(other._likes, _likes)&&const DeepCollectionEquality().equals(other._dislikes, _dislikes)&&(identical(other.speakingTone, speakingTone) || other.speakingTone == speakingTone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_traits),const DeepCollectionEquality().hash(_interests),communicationStyle,backstory,const DeepCollectionEquality().hash(_quirks),const DeepCollectionEquality().hash(_likes),const DeepCollectionEquality().hash(_dislikes),speakingTone);

@override
String toString() {
  return 'CharacterPersonality(traits: $traits, interests: $interests, communicationStyle: $communicationStyle, backstory: $backstory, quirks: $quirks, likes: $likes, dislikes: $dislikes, speakingTone: $speakingTone)';
}


}

/// @nodoc
abstract mixin class _$CharacterPersonalityCopyWith<$Res> implements $CharacterPersonalityCopyWith<$Res> {
  factory _$CharacterPersonalityCopyWith(_CharacterPersonality value, $Res Function(_CharacterPersonality) _then) = __$CharacterPersonalityCopyWithImpl;
@override @useResult
$Res call({
 List<String>? traits, List<String>? interests,@JsonKey(name: 'communication_style') String? communicationStyle, String? backstory, List<String>? quirks, List<String>? likes, List<String>? dislikes,@JsonKey(name: 'speaking_tone') String? speakingTone
});




}
/// @nodoc
class __$CharacterPersonalityCopyWithImpl<$Res>
    implements _$CharacterPersonalityCopyWith<$Res> {
  __$CharacterPersonalityCopyWithImpl(this._self, this._then);

  final _CharacterPersonality _self;
  final $Res Function(_CharacterPersonality) _then;

/// Create a copy of CharacterPersonality
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? traits = freezed,Object? interests = freezed,Object? communicationStyle = freezed,Object? backstory = freezed,Object? quirks = freezed,Object? likes = freezed,Object? dislikes = freezed,Object? speakingTone = freezed,}) {
  return _then(_CharacterPersonality(
traits: freezed == traits ? _self._traits : traits // ignore: cast_nullable_to_non_nullable
as List<String>?,interests: freezed == interests ? _self._interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>?,communicationStyle: freezed == communicationStyle ? _self.communicationStyle : communicationStyle // ignore: cast_nullable_to_non_nullable
as String?,backstory: freezed == backstory ? _self.backstory : backstory // ignore: cast_nullable_to_non_nullable
as String?,quirks: freezed == quirks ? _self._quirks : quirks // ignore: cast_nullable_to_non_nullable
as List<String>?,likes: freezed == likes ? _self._likes : likes // ignore: cast_nullable_to_non_nullable
as List<String>?,dislikes: freezed == dislikes ? _self._dislikes : dislikes // ignore: cast_nullable_to_non_nullable
as List<String>?,speakingTone: freezed == speakingTone ? _self.speakingTone : speakingTone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
