// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_requests.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateCharacterRequest {

 String get name; String? get tagline; String? get description;@JsonKey(name: 'avatar_url') String? get avatarUrl;@JsonKey(name: 'banner_url') String? get bannerUrl; String? get style; String? get gender; CharacterAppearance? get appearance; CharacterPersonality? get personality;@JsonKey(name: 'system_prompt') String? get systemPrompt;@JsonKey(name: 'greeting_message') String? get greetingMessage; List<String>? get categories;@JsonKey(name: 'is_public') bool? get isPublic;@JsonKey(name: 'is_nsfw') bool? get isNsfw;
/// Create a copy of CreateCharacterRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCharacterRequestCopyWith<CreateCharacterRequest> get copyWith => _$CreateCharacterRequestCopyWithImpl<CreateCharacterRequest>(this as CreateCharacterRequest, _$identity);

  /// Serializes this CreateCharacterRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCharacterRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.description, description) || other.description == description)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bannerUrl, bannerUrl) || other.bannerUrl == bannerUrl)&&(identical(other.style, style) || other.style == style)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.appearance, appearance) || other.appearance == appearance)&&(identical(other.personality, personality) || other.personality == personality)&&(identical(other.systemPrompt, systemPrompt) || other.systemPrompt == systemPrompt)&&(identical(other.greetingMessage, greetingMessage) || other.greetingMessage == greetingMessage)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isNsfw, isNsfw) || other.isNsfw == isNsfw));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,tagline,description,avatarUrl,bannerUrl,style,gender,appearance,personality,systemPrompt,greetingMessage,const DeepCollectionEquality().hash(categories),isPublic,isNsfw);

@override
String toString() {
  return 'CreateCharacterRequest(name: $name, tagline: $tagline, description: $description, avatarUrl: $avatarUrl, bannerUrl: $bannerUrl, style: $style, gender: $gender, appearance: $appearance, personality: $personality, systemPrompt: $systemPrompt, greetingMessage: $greetingMessage, categories: $categories, isPublic: $isPublic, isNsfw: $isNsfw)';
}


}

/// @nodoc
abstract mixin class $CreateCharacterRequestCopyWith<$Res>  {
  factory $CreateCharacterRequestCopyWith(CreateCharacterRequest value, $Res Function(CreateCharacterRequest) _then) = _$CreateCharacterRequestCopyWithImpl;
@useResult
$Res call({
 String name, String? tagline, String? description,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'banner_url') String? bannerUrl, String? style, String? gender, CharacterAppearance? appearance, CharacterPersonality? personality,@JsonKey(name: 'system_prompt') String? systemPrompt,@JsonKey(name: 'greeting_message') String? greetingMessage, List<String>? categories,@JsonKey(name: 'is_public') bool? isPublic,@JsonKey(name: 'is_nsfw') bool? isNsfw
});


$CharacterAppearanceCopyWith<$Res>? get appearance;$CharacterPersonalityCopyWith<$Res>? get personality;

}
/// @nodoc
class _$CreateCharacterRequestCopyWithImpl<$Res>
    implements $CreateCharacterRequestCopyWith<$Res> {
  _$CreateCharacterRequestCopyWithImpl(this._self, this._then);

  final CreateCharacterRequest _self;
  final $Res Function(CreateCharacterRequest) _then;

/// Create a copy of CreateCharacterRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? tagline = freezed,Object? description = freezed,Object? avatarUrl = freezed,Object? bannerUrl = freezed,Object? style = freezed,Object? gender = freezed,Object? appearance = freezed,Object? personality = freezed,Object? systemPrompt = freezed,Object? greetingMessage = freezed,Object? categories = freezed,Object? isPublic = freezed,Object? isNsfw = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tagline: freezed == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,bannerUrl: freezed == bannerUrl ? _self.bannerUrl : bannerUrl // ignore: cast_nullable_to_non_nullable
as String?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,appearance: freezed == appearance ? _self.appearance : appearance // ignore: cast_nullable_to_non_nullable
as CharacterAppearance?,personality: freezed == personality ? _self.personality : personality // ignore: cast_nullable_to_non_nullable
as CharacterPersonality?,systemPrompt: freezed == systemPrompt ? _self.systemPrompt : systemPrompt // ignore: cast_nullable_to_non_nullable
as String?,greetingMessage: freezed == greetingMessage ? _self.greetingMessage : greetingMessage // ignore: cast_nullable_to_non_nullable
as String?,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>?,isPublic: freezed == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool?,isNsfw: freezed == isNsfw ? _self.isNsfw : isNsfw // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of CreateCharacterRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterAppearanceCopyWith<$Res>? get appearance {
    if (_self.appearance == null) {
    return null;
  }

  return $CharacterAppearanceCopyWith<$Res>(_self.appearance!, (value) {
    return _then(_self.copyWith(appearance: value));
  });
}/// Create a copy of CreateCharacterRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterPersonalityCopyWith<$Res>? get personality {
    if (_self.personality == null) {
    return null;
  }

  return $CharacterPersonalityCopyWith<$Res>(_self.personality!, (value) {
    return _then(_self.copyWith(personality: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateCharacterRequest].
extension CreateCharacterRequestPatterns on CreateCharacterRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateCharacterRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateCharacterRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateCharacterRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateCharacterRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateCharacterRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateCharacterRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? tagline,  String? description, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'banner_url')  String? bannerUrl,  String? style,  String? gender,  CharacterAppearance? appearance,  CharacterPersonality? personality, @JsonKey(name: 'system_prompt')  String? systemPrompt, @JsonKey(name: 'greeting_message')  String? greetingMessage,  List<String>? categories, @JsonKey(name: 'is_public')  bool? isPublic, @JsonKey(name: 'is_nsfw')  bool? isNsfw)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateCharacterRequest() when $default != null:
return $default(_that.name,_that.tagline,_that.description,_that.avatarUrl,_that.bannerUrl,_that.style,_that.gender,_that.appearance,_that.personality,_that.systemPrompt,_that.greetingMessage,_that.categories,_that.isPublic,_that.isNsfw);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? tagline,  String? description, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'banner_url')  String? bannerUrl,  String? style,  String? gender,  CharacterAppearance? appearance,  CharacterPersonality? personality, @JsonKey(name: 'system_prompt')  String? systemPrompt, @JsonKey(name: 'greeting_message')  String? greetingMessage,  List<String>? categories, @JsonKey(name: 'is_public')  bool? isPublic, @JsonKey(name: 'is_nsfw')  bool? isNsfw)  $default,) {final _that = this;
switch (_that) {
case _CreateCharacterRequest():
return $default(_that.name,_that.tagline,_that.description,_that.avatarUrl,_that.bannerUrl,_that.style,_that.gender,_that.appearance,_that.personality,_that.systemPrompt,_that.greetingMessage,_that.categories,_that.isPublic,_that.isNsfw);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? tagline,  String? description, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'banner_url')  String? bannerUrl,  String? style,  String? gender,  CharacterAppearance? appearance,  CharacterPersonality? personality, @JsonKey(name: 'system_prompt')  String? systemPrompt, @JsonKey(name: 'greeting_message')  String? greetingMessage,  List<String>? categories, @JsonKey(name: 'is_public')  bool? isPublic, @JsonKey(name: 'is_nsfw')  bool? isNsfw)?  $default,) {final _that = this;
switch (_that) {
case _CreateCharacterRequest() when $default != null:
return $default(_that.name,_that.tagline,_that.description,_that.avatarUrl,_that.bannerUrl,_that.style,_that.gender,_that.appearance,_that.personality,_that.systemPrompt,_that.greetingMessage,_that.categories,_that.isPublic,_that.isNsfw);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateCharacterRequest implements CreateCharacterRequest {
  const _CreateCharacterRequest({required this.name, this.tagline, this.description, @JsonKey(name: 'avatar_url') this.avatarUrl, @JsonKey(name: 'banner_url') this.bannerUrl, this.style, this.gender, this.appearance, this.personality, @JsonKey(name: 'system_prompt') this.systemPrompt, @JsonKey(name: 'greeting_message') this.greetingMessage, final  List<String>? categories, @JsonKey(name: 'is_public') this.isPublic, @JsonKey(name: 'is_nsfw') this.isNsfw}): _categories = categories;
  factory _CreateCharacterRequest.fromJson(Map<String, dynamic> json) => _$CreateCharacterRequestFromJson(json);

@override final  String name;
@override final  String? tagline;
@override final  String? description;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override@JsonKey(name: 'banner_url') final  String? bannerUrl;
@override final  String? style;
@override final  String? gender;
@override final  CharacterAppearance? appearance;
@override final  CharacterPersonality? personality;
@override@JsonKey(name: 'system_prompt') final  String? systemPrompt;
@override@JsonKey(name: 'greeting_message') final  String? greetingMessage;
 final  List<String>? _categories;
@override List<String>? get categories {
  final value = _categories;
  if (value == null) return null;
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'is_public') final  bool? isPublic;
@override@JsonKey(name: 'is_nsfw') final  bool? isNsfw;

/// Create a copy of CreateCharacterRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCharacterRequestCopyWith<_CreateCharacterRequest> get copyWith => __$CreateCharacterRequestCopyWithImpl<_CreateCharacterRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateCharacterRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateCharacterRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.description, description) || other.description == description)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bannerUrl, bannerUrl) || other.bannerUrl == bannerUrl)&&(identical(other.style, style) || other.style == style)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.appearance, appearance) || other.appearance == appearance)&&(identical(other.personality, personality) || other.personality == personality)&&(identical(other.systemPrompt, systemPrompt) || other.systemPrompt == systemPrompt)&&(identical(other.greetingMessage, greetingMessage) || other.greetingMessage == greetingMessage)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isNsfw, isNsfw) || other.isNsfw == isNsfw));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,tagline,description,avatarUrl,bannerUrl,style,gender,appearance,personality,systemPrompt,greetingMessage,const DeepCollectionEquality().hash(_categories),isPublic,isNsfw);

@override
String toString() {
  return 'CreateCharacterRequest(name: $name, tagline: $tagline, description: $description, avatarUrl: $avatarUrl, bannerUrl: $bannerUrl, style: $style, gender: $gender, appearance: $appearance, personality: $personality, systemPrompt: $systemPrompt, greetingMessage: $greetingMessage, categories: $categories, isPublic: $isPublic, isNsfw: $isNsfw)';
}


}

/// @nodoc
abstract mixin class _$CreateCharacterRequestCopyWith<$Res> implements $CreateCharacterRequestCopyWith<$Res> {
  factory _$CreateCharacterRequestCopyWith(_CreateCharacterRequest value, $Res Function(_CreateCharacterRequest) _then) = __$CreateCharacterRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String? tagline, String? description,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'banner_url') String? bannerUrl, String? style, String? gender, CharacterAppearance? appearance, CharacterPersonality? personality,@JsonKey(name: 'system_prompt') String? systemPrompt,@JsonKey(name: 'greeting_message') String? greetingMessage, List<String>? categories,@JsonKey(name: 'is_public') bool? isPublic,@JsonKey(name: 'is_nsfw') bool? isNsfw
});


@override $CharacterAppearanceCopyWith<$Res>? get appearance;@override $CharacterPersonalityCopyWith<$Res>? get personality;

}
/// @nodoc
class __$CreateCharacterRequestCopyWithImpl<$Res>
    implements _$CreateCharacterRequestCopyWith<$Res> {
  __$CreateCharacterRequestCopyWithImpl(this._self, this._then);

  final _CreateCharacterRequest _self;
  final $Res Function(_CreateCharacterRequest) _then;

/// Create a copy of CreateCharacterRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? tagline = freezed,Object? description = freezed,Object? avatarUrl = freezed,Object? bannerUrl = freezed,Object? style = freezed,Object? gender = freezed,Object? appearance = freezed,Object? personality = freezed,Object? systemPrompt = freezed,Object? greetingMessage = freezed,Object? categories = freezed,Object? isPublic = freezed,Object? isNsfw = freezed,}) {
  return _then(_CreateCharacterRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tagline: freezed == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,bannerUrl: freezed == bannerUrl ? _self.bannerUrl : bannerUrl // ignore: cast_nullable_to_non_nullable
as String?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,appearance: freezed == appearance ? _self.appearance : appearance // ignore: cast_nullable_to_non_nullable
as CharacterAppearance?,personality: freezed == personality ? _self.personality : personality // ignore: cast_nullable_to_non_nullable
as CharacterPersonality?,systemPrompt: freezed == systemPrompt ? _self.systemPrompt : systemPrompt // ignore: cast_nullable_to_non_nullable
as String?,greetingMessage: freezed == greetingMessage ? _self.greetingMessage : greetingMessage // ignore: cast_nullable_to_non_nullable
as String?,categories: freezed == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>?,isPublic: freezed == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool?,isNsfw: freezed == isNsfw ? _self.isNsfw : isNsfw // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of CreateCharacterRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterAppearanceCopyWith<$Res>? get appearance {
    if (_self.appearance == null) {
    return null;
  }

  return $CharacterAppearanceCopyWith<$Res>(_self.appearance!, (value) {
    return _then(_self.copyWith(appearance: value));
  });
}/// Create a copy of CreateCharacterRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterPersonalityCopyWith<$Res>? get personality {
    if (_self.personality == null) {
    return null;
  }

  return $CharacterPersonalityCopyWith<$Res>(_self.personality!, (value) {
    return _then(_self.copyWith(personality: value));
  });
}
}


/// @nodoc
mixin _$UpdateCharacterRequest {

 String? get name; String? get tagline; String? get description;@JsonKey(name: 'avatar_url') String? get avatarUrl;@JsonKey(name: 'banner_url') String? get bannerUrl; String? get style; String? get gender; CharacterAppearance? get appearance; CharacterPersonality? get personality;@JsonKey(name: 'system_prompt') String? get systemPrompt;@JsonKey(name: 'greeting_message') String? get greetingMessage; List<String>? get categories;@JsonKey(name: 'is_public') bool? get isPublic;@JsonKey(name: 'is_nsfw') bool? get isNsfw;
/// Create a copy of UpdateCharacterRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateCharacterRequestCopyWith<UpdateCharacterRequest> get copyWith => _$UpdateCharacterRequestCopyWithImpl<UpdateCharacterRequest>(this as UpdateCharacterRequest, _$identity);

  /// Serializes this UpdateCharacterRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateCharacterRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.description, description) || other.description == description)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bannerUrl, bannerUrl) || other.bannerUrl == bannerUrl)&&(identical(other.style, style) || other.style == style)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.appearance, appearance) || other.appearance == appearance)&&(identical(other.personality, personality) || other.personality == personality)&&(identical(other.systemPrompt, systemPrompt) || other.systemPrompt == systemPrompt)&&(identical(other.greetingMessage, greetingMessage) || other.greetingMessage == greetingMessage)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isNsfw, isNsfw) || other.isNsfw == isNsfw));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,tagline,description,avatarUrl,bannerUrl,style,gender,appearance,personality,systemPrompt,greetingMessage,const DeepCollectionEquality().hash(categories),isPublic,isNsfw);

@override
String toString() {
  return 'UpdateCharacterRequest(name: $name, tagline: $tagline, description: $description, avatarUrl: $avatarUrl, bannerUrl: $bannerUrl, style: $style, gender: $gender, appearance: $appearance, personality: $personality, systemPrompt: $systemPrompt, greetingMessage: $greetingMessage, categories: $categories, isPublic: $isPublic, isNsfw: $isNsfw)';
}


}

/// @nodoc
abstract mixin class $UpdateCharacterRequestCopyWith<$Res>  {
  factory $UpdateCharacterRequestCopyWith(UpdateCharacterRequest value, $Res Function(UpdateCharacterRequest) _then) = _$UpdateCharacterRequestCopyWithImpl;
@useResult
$Res call({
 String? name, String? tagline, String? description,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'banner_url') String? bannerUrl, String? style, String? gender, CharacterAppearance? appearance, CharacterPersonality? personality,@JsonKey(name: 'system_prompt') String? systemPrompt,@JsonKey(name: 'greeting_message') String? greetingMessage, List<String>? categories,@JsonKey(name: 'is_public') bool? isPublic,@JsonKey(name: 'is_nsfw') bool? isNsfw
});


$CharacterAppearanceCopyWith<$Res>? get appearance;$CharacterPersonalityCopyWith<$Res>? get personality;

}
/// @nodoc
class _$UpdateCharacterRequestCopyWithImpl<$Res>
    implements $UpdateCharacterRequestCopyWith<$Res> {
  _$UpdateCharacterRequestCopyWithImpl(this._self, this._then);

  final UpdateCharacterRequest _self;
  final $Res Function(UpdateCharacterRequest) _then;

/// Create a copy of UpdateCharacterRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? tagline = freezed,Object? description = freezed,Object? avatarUrl = freezed,Object? bannerUrl = freezed,Object? style = freezed,Object? gender = freezed,Object? appearance = freezed,Object? personality = freezed,Object? systemPrompt = freezed,Object? greetingMessage = freezed,Object? categories = freezed,Object? isPublic = freezed,Object? isNsfw = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,tagline: freezed == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,bannerUrl: freezed == bannerUrl ? _self.bannerUrl : bannerUrl // ignore: cast_nullable_to_non_nullable
as String?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,appearance: freezed == appearance ? _self.appearance : appearance // ignore: cast_nullable_to_non_nullable
as CharacterAppearance?,personality: freezed == personality ? _self.personality : personality // ignore: cast_nullable_to_non_nullable
as CharacterPersonality?,systemPrompt: freezed == systemPrompt ? _self.systemPrompt : systemPrompt // ignore: cast_nullable_to_non_nullable
as String?,greetingMessage: freezed == greetingMessage ? _self.greetingMessage : greetingMessage // ignore: cast_nullable_to_non_nullable
as String?,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>?,isPublic: freezed == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool?,isNsfw: freezed == isNsfw ? _self.isNsfw : isNsfw // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of UpdateCharacterRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterAppearanceCopyWith<$Res>? get appearance {
    if (_self.appearance == null) {
    return null;
  }

  return $CharacterAppearanceCopyWith<$Res>(_self.appearance!, (value) {
    return _then(_self.copyWith(appearance: value));
  });
}/// Create a copy of UpdateCharacterRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterPersonalityCopyWith<$Res>? get personality {
    if (_self.personality == null) {
    return null;
  }

  return $CharacterPersonalityCopyWith<$Res>(_self.personality!, (value) {
    return _then(_self.copyWith(personality: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateCharacterRequest].
extension UpdateCharacterRequestPatterns on UpdateCharacterRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateCharacterRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateCharacterRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateCharacterRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateCharacterRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateCharacterRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateCharacterRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? tagline,  String? description, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'banner_url')  String? bannerUrl,  String? style,  String? gender,  CharacterAppearance? appearance,  CharacterPersonality? personality, @JsonKey(name: 'system_prompt')  String? systemPrompt, @JsonKey(name: 'greeting_message')  String? greetingMessage,  List<String>? categories, @JsonKey(name: 'is_public')  bool? isPublic, @JsonKey(name: 'is_nsfw')  bool? isNsfw)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateCharacterRequest() when $default != null:
return $default(_that.name,_that.tagline,_that.description,_that.avatarUrl,_that.bannerUrl,_that.style,_that.gender,_that.appearance,_that.personality,_that.systemPrompt,_that.greetingMessage,_that.categories,_that.isPublic,_that.isNsfw);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? tagline,  String? description, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'banner_url')  String? bannerUrl,  String? style,  String? gender,  CharacterAppearance? appearance,  CharacterPersonality? personality, @JsonKey(name: 'system_prompt')  String? systemPrompt, @JsonKey(name: 'greeting_message')  String? greetingMessage,  List<String>? categories, @JsonKey(name: 'is_public')  bool? isPublic, @JsonKey(name: 'is_nsfw')  bool? isNsfw)  $default,) {final _that = this;
switch (_that) {
case _UpdateCharacterRequest():
return $default(_that.name,_that.tagline,_that.description,_that.avatarUrl,_that.bannerUrl,_that.style,_that.gender,_that.appearance,_that.personality,_that.systemPrompt,_that.greetingMessage,_that.categories,_that.isPublic,_that.isNsfw);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? tagline,  String? description, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'banner_url')  String? bannerUrl,  String? style,  String? gender,  CharacterAppearance? appearance,  CharacterPersonality? personality, @JsonKey(name: 'system_prompt')  String? systemPrompt, @JsonKey(name: 'greeting_message')  String? greetingMessage,  List<String>? categories, @JsonKey(name: 'is_public')  bool? isPublic, @JsonKey(name: 'is_nsfw')  bool? isNsfw)?  $default,) {final _that = this;
switch (_that) {
case _UpdateCharacterRequest() when $default != null:
return $default(_that.name,_that.tagline,_that.description,_that.avatarUrl,_that.bannerUrl,_that.style,_that.gender,_that.appearance,_that.personality,_that.systemPrompt,_that.greetingMessage,_that.categories,_that.isPublic,_that.isNsfw);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateCharacterRequest implements UpdateCharacterRequest {
  const _UpdateCharacterRequest({this.name, this.tagline, this.description, @JsonKey(name: 'avatar_url') this.avatarUrl, @JsonKey(name: 'banner_url') this.bannerUrl, this.style, this.gender, this.appearance, this.personality, @JsonKey(name: 'system_prompt') this.systemPrompt, @JsonKey(name: 'greeting_message') this.greetingMessage, final  List<String>? categories, @JsonKey(name: 'is_public') this.isPublic, @JsonKey(name: 'is_nsfw') this.isNsfw}): _categories = categories;
  factory _UpdateCharacterRequest.fromJson(Map<String, dynamic> json) => _$UpdateCharacterRequestFromJson(json);

@override final  String? name;
@override final  String? tagline;
@override final  String? description;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override@JsonKey(name: 'banner_url') final  String? bannerUrl;
@override final  String? style;
@override final  String? gender;
@override final  CharacterAppearance? appearance;
@override final  CharacterPersonality? personality;
@override@JsonKey(name: 'system_prompt') final  String? systemPrompt;
@override@JsonKey(name: 'greeting_message') final  String? greetingMessage;
 final  List<String>? _categories;
@override List<String>? get categories {
  final value = _categories;
  if (value == null) return null;
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'is_public') final  bool? isPublic;
@override@JsonKey(name: 'is_nsfw') final  bool? isNsfw;

/// Create a copy of UpdateCharacterRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCharacterRequestCopyWith<_UpdateCharacterRequest> get copyWith => __$UpdateCharacterRequestCopyWithImpl<_UpdateCharacterRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateCharacterRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateCharacterRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.description, description) || other.description == description)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bannerUrl, bannerUrl) || other.bannerUrl == bannerUrl)&&(identical(other.style, style) || other.style == style)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.appearance, appearance) || other.appearance == appearance)&&(identical(other.personality, personality) || other.personality == personality)&&(identical(other.systemPrompt, systemPrompt) || other.systemPrompt == systemPrompt)&&(identical(other.greetingMessage, greetingMessage) || other.greetingMessage == greetingMessage)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isNsfw, isNsfw) || other.isNsfw == isNsfw));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,tagline,description,avatarUrl,bannerUrl,style,gender,appearance,personality,systemPrompt,greetingMessage,const DeepCollectionEquality().hash(_categories),isPublic,isNsfw);

@override
String toString() {
  return 'UpdateCharacterRequest(name: $name, tagline: $tagline, description: $description, avatarUrl: $avatarUrl, bannerUrl: $bannerUrl, style: $style, gender: $gender, appearance: $appearance, personality: $personality, systemPrompt: $systemPrompt, greetingMessage: $greetingMessage, categories: $categories, isPublic: $isPublic, isNsfw: $isNsfw)';
}


}

/// @nodoc
abstract mixin class _$UpdateCharacterRequestCopyWith<$Res> implements $UpdateCharacterRequestCopyWith<$Res> {
  factory _$UpdateCharacterRequestCopyWith(_UpdateCharacterRequest value, $Res Function(_UpdateCharacterRequest) _then) = __$UpdateCharacterRequestCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? tagline, String? description,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'banner_url') String? bannerUrl, String? style, String? gender, CharacterAppearance? appearance, CharacterPersonality? personality,@JsonKey(name: 'system_prompt') String? systemPrompt,@JsonKey(name: 'greeting_message') String? greetingMessage, List<String>? categories,@JsonKey(name: 'is_public') bool? isPublic,@JsonKey(name: 'is_nsfw') bool? isNsfw
});


@override $CharacterAppearanceCopyWith<$Res>? get appearance;@override $CharacterPersonalityCopyWith<$Res>? get personality;

}
/// @nodoc
class __$UpdateCharacterRequestCopyWithImpl<$Res>
    implements _$UpdateCharacterRequestCopyWith<$Res> {
  __$UpdateCharacterRequestCopyWithImpl(this._self, this._then);

  final _UpdateCharacterRequest _self;
  final $Res Function(_UpdateCharacterRequest) _then;

/// Create a copy of UpdateCharacterRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? tagline = freezed,Object? description = freezed,Object? avatarUrl = freezed,Object? bannerUrl = freezed,Object? style = freezed,Object? gender = freezed,Object? appearance = freezed,Object? personality = freezed,Object? systemPrompt = freezed,Object? greetingMessage = freezed,Object? categories = freezed,Object? isPublic = freezed,Object? isNsfw = freezed,}) {
  return _then(_UpdateCharacterRequest(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,tagline: freezed == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,bannerUrl: freezed == bannerUrl ? _self.bannerUrl : bannerUrl // ignore: cast_nullable_to_non_nullable
as String?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,appearance: freezed == appearance ? _self.appearance : appearance // ignore: cast_nullable_to_non_nullable
as CharacterAppearance?,personality: freezed == personality ? _self.personality : personality // ignore: cast_nullable_to_non_nullable
as CharacterPersonality?,systemPrompt: freezed == systemPrompt ? _self.systemPrompt : systemPrompt // ignore: cast_nullable_to_non_nullable
as String?,greetingMessage: freezed == greetingMessage ? _self.greetingMessage : greetingMessage // ignore: cast_nullable_to_non_nullable
as String?,categories: freezed == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>?,isPublic: freezed == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool?,isNsfw: freezed == isNsfw ? _self.isNsfw : isNsfw // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of UpdateCharacterRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterAppearanceCopyWith<$Res>? get appearance {
    if (_self.appearance == null) {
    return null;
  }

  return $CharacterAppearanceCopyWith<$Res>(_self.appearance!, (value) {
    return _then(_self.copyWith(appearance: value));
  });
}/// Create a copy of UpdateCharacterRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterPersonalityCopyWith<$Res>? get personality {
    if (_self.personality == null) {
    return null;
  }

  return $CharacterPersonalityCopyWith<$Res>(_self.personality!, (value) {
    return _then(_self.copyWith(personality: value));
  });
}
}


/// @nodoc
mixin _$FavoriteResponse {

@JsonKey(name: 'is_favorited') bool get isFavorited;
/// Create a copy of FavoriteResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteResponseCopyWith<FavoriteResponse> get copyWith => _$FavoriteResponseCopyWithImpl<FavoriteResponse>(this as FavoriteResponse, _$identity);

  /// Serializes this FavoriteResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteResponse&&(identical(other.isFavorited, isFavorited) || other.isFavorited == isFavorited));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isFavorited);

@override
String toString() {
  return 'FavoriteResponse(isFavorited: $isFavorited)';
}


}

/// @nodoc
abstract mixin class $FavoriteResponseCopyWith<$Res>  {
  factory $FavoriteResponseCopyWith(FavoriteResponse value, $Res Function(FavoriteResponse) _then) = _$FavoriteResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'is_favorited') bool isFavorited
});




}
/// @nodoc
class _$FavoriteResponseCopyWithImpl<$Res>
    implements $FavoriteResponseCopyWith<$Res> {
  _$FavoriteResponseCopyWithImpl(this._self, this._then);

  final FavoriteResponse _self;
  final $Res Function(FavoriteResponse) _then;

/// Create a copy of FavoriteResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isFavorited = null,}) {
  return _then(_self.copyWith(
isFavorited: null == isFavorited ? _self.isFavorited : isFavorited // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FavoriteResponse].
extension FavoriteResponsePatterns on FavoriteResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoriteResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoriteResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoriteResponse value)  $default,){
final _that = this;
switch (_that) {
case _FavoriteResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoriteResponse value)?  $default,){
final _that = this;
switch (_that) {
case _FavoriteResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_favorited')  bool isFavorited)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoriteResponse() when $default != null:
return $default(_that.isFavorited);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_favorited')  bool isFavorited)  $default,) {final _that = this;
switch (_that) {
case _FavoriteResponse():
return $default(_that.isFavorited);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'is_favorited')  bool isFavorited)?  $default,) {final _that = this;
switch (_that) {
case _FavoriteResponse() when $default != null:
return $default(_that.isFavorited);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FavoriteResponse implements FavoriteResponse {
  const _FavoriteResponse({@JsonKey(name: 'is_favorited') required this.isFavorited});
  factory _FavoriteResponse.fromJson(Map<String, dynamic> json) => _$FavoriteResponseFromJson(json);

@override@JsonKey(name: 'is_favorited') final  bool isFavorited;

/// Create a copy of FavoriteResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteResponseCopyWith<_FavoriteResponse> get copyWith => __$FavoriteResponseCopyWithImpl<_FavoriteResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FavoriteResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteResponse&&(identical(other.isFavorited, isFavorited) || other.isFavorited == isFavorited));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isFavorited);

@override
String toString() {
  return 'FavoriteResponse(isFavorited: $isFavorited)';
}


}

/// @nodoc
abstract mixin class _$FavoriteResponseCopyWith<$Res> implements $FavoriteResponseCopyWith<$Res> {
  factory _$FavoriteResponseCopyWith(_FavoriteResponse value, $Res Function(_FavoriteResponse) _then) = __$FavoriteResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'is_favorited') bool isFavorited
});




}
/// @nodoc
class __$FavoriteResponseCopyWithImpl<$Res>
    implements _$FavoriteResponseCopyWith<$Res> {
  __$FavoriteResponseCopyWithImpl(this._self, this._then);

  final _FavoriteResponse _self;
  final $Res Function(_FavoriteResponse) _then;

/// Create a copy of FavoriteResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isFavorited = null,}) {
  return _then(_FavoriteResponse(
isFavorited: null == isFavorited ? _self.isFavorited : isFavorited // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
