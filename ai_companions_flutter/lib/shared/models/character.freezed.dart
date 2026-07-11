// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Character {

 String get id; String get name; String? get tagline; String? get description;@JsonKey(name: 'avatar_url') String? get avatarUrl;@JsonKey(name: 'banner_url') String? get bannerUrl; CharacterStyle get style; CharacterGender get gender; CharacterAppearance get appearance; CharacterPersonality get personality;@JsonKey(name: 'system_prompt') String? get systemPrompt;@JsonKey(name: 'greeting_message') String get greetingMessage; List<String> get categories;@JsonKey(name: 'chat_count') int get chatCount;@JsonKey(name: 'favorite_count') int get favoriteCount;@JsonKey(name: 'is_public') bool get isPublic;@JsonKey(name: 'is_official') bool get isOfficial;@JsonKey(name: 'is_nsfw') bool get isNsfw;@JsonKey(name: 'creator_id') String? get creatorId;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;@JsonKey(name: 'is_favorited') bool? get isFavorited;@JsonKey(name: 'voice_id') String? get voiceId;
/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterCopyWith<Character> get copyWith => _$CharacterCopyWithImpl<Character>(this as Character, _$identity);

  /// Serializes this Character to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Character&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.description, description) || other.description == description)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bannerUrl, bannerUrl) || other.bannerUrl == bannerUrl)&&(identical(other.style, style) || other.style == style)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.appearance, appearance) || other.appearance == appearance)&&(identical(other.personality, personality) || other.personality == personality)&&(identical(other.systemPrompt, systemPrompt) || other.systemPrompt == systemPrompt)&&(identical(other.greetingMessage, greetingMessage) || other.greetingMessage == greetingMessage)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.chatCount, chatCount) || other.chatCount == chatCount)&&(identical(other.favoriteCount, favoriteCount) || other.favoriteCount == favoriteCount)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isOfficial, isOfficial) || other.isOfficial == isOfficial)&&(identical(other.isNsfw, isNsfw) || other.isNsfw == isNsfw)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isFavorited, isFavorited) || other.isFavorited == isFavorited)&&(identical(other.voiceId, voiceId) || other.voiceId == voiceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,tagline,description,avatarUrl,bannerUrl,style,gender,appearance,personality,systemPrompt,greetingMessage,const DeepCollectionEquality().hash(categories),chatCount,favoriteCount,isPublic,isOfficial,isNsfw,creatorId,createdAt,updatedAt,isFavorited,voiceId]);

@override
String toString() {
  return 'Character(id: $id, name: $name, tagline: $tagline, description: $description, avatarUrl: $avatarUrl, bannerUrl: $bannerUrl, style: $style, gender: $gender, appearance: $appearance, personality: $personality, systemPrompt: $systemPrompt, greetingMessage: $greetingMessage, categories: $categories, chatCount: $chatCount, favoriteCount: $favoriteCount, isPublic: $isPublic, isOfficial: $isOfficial, isNsfw: $isNsfw, creatorId: $creatorId, createdAt: $createdAt, updatedAt: $updatedAt, isFavorited: $isFavorited, voiceId: $voiceId)';
}


}

/// @nodoc
abstract mixin class $CharacterCopyWith<$Res>  {
  factory $CharacterCopyWith(Character value, $Res Function(Character) _then) = _$CharacterCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? tagline, String? description,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'banner_url') String? bannerUrl, CharacterStyle style, CharacterGender gender, CharacterAppearance appearance, CharacterPersonality personality,@JsonKey(name: 'system_prompt') String? systemPrompt,@JsonKey(name: 'greeting_message') String greetingMessage, List<String> categories,@JsonKey(name: 'chat_count') int chatCount,@JsonKey(name: 'favorite_count') int favoriteCount,@JsonKey(name: 'is_public') bool isPublic,@JsonKey(name: 'is_official') bool isOfficial,@JsonKey(name: 'is_nsfw') bool isNsfw,@JsonKey(name: 'creator_id') String? creatorId,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'is_favorited') bool? isFavorited,@JsonKey(name: 'voice_id') String? voiceId
});


$CharacterAppearanceCopyWith<$Res> get appearance;$CharacterPersonalityCopyWith<$Res> get personality;

}
/// @nodoc
class _$CharacterCopyWithImpl<$Res>
    implements $CharacterCopyWith<$Res> {
  _$CharacterCopyWithImpl(this._self, this._then);

  final Character _self;
  final $Res Function(Character) _then;

/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? tagline = freezed,Object? description = freezed,Object? avatarUrl = freezed,Object? bannerUrl = freezed,Object? style = null,Object? gender = null,Object? appearance = null,Object? personality = null,Object? systemPrompt = freezed,Object? greetingMessage = null,Object? categories = null,Object? chatCount = null,Object? favoriteCount = null,Object? isPublic = null,Object? isOfficial = null,Object? isNsfw = null,Object? creatorId = freezed,Object? createdAt = null,Object? updatedAt = null,Object? isFavorited = freezed,Object? voiceId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tagline: freezed == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,bannerUrl: freezed == bannerUrl ? _self.bannerUrl : bannerUrl // ignore: cast_nullable_to_non_nullable
as String?,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as CharacterStyle,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as CharacterGender,appearance: null == appearance ? _self.appearance : appearance // ignore: cast_nullable_to_non_nullable
as CharacterAppearance,personality: null == personality ? _self.personality : personality // ignore: cast_nullable_to_non_nullable
as CharacterPersonality,systemPrompt: freezed == systemPrompt ? _self.systemPrompt : systemPrompt // ignore: cast_nullable_to_non_nullable
as String?,greetingMessage: null == greetingMessage ? _self.greetingMessage : greetingMessage // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,chatCount: null == chatCount ? _self.chatCount : chatCount // ignore: cast_nullable_to_non_nullable
as int,favoriteCount: null == favoriteCount ? _self.favoriteCount : favoriteCount // ignore: cast_nullable_to_non_nullable
as int,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,isOfficial: null == isOfficial ? _self.isOfficial : isOfficial // ignore: cast_nullable_to_non_nullable
as bool,isNsfw: null == isNsfw ? _self.isNsfw : isNsfw // ignore: cast_nullable_to_non_nullable
as bool,creatorId: freezed == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,isFavorited: freezed == isFavorited ? _self.isFavorited : isFavorited // ignore: cast_nullable_to_non_nullable
as bool?,voiceId: freezed == voiceId ? _self.voiceId : voiceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterAppearanceCopyWith<$Res> get appearance {
  
  return $CharacterAppearanceCopyWith<$Res>(_self.appearance, (value) {
    return _then(_self.copyWith(appearance: value));
  });
}/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterPersonalityCopyWith<$Res> get personality {
  
  return $CharacterPersonalityCopyWith<$Res>(_self.personality, (value) {
    return _then(_self.copyWith(personality: value));
  });
}
}


/// Adds pattern-matching-related methods to [Character].
extension CharacterPatterns on Character {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Character value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Character() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Character value)  $default,){
final _that = this;
switch (_that) {
case _Character():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Character value)?  $default,){
final _that = this;
switch (_that) {
case _Character() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? tagline,  String? description, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'banner_url')  String? bannerUrl,  CharacterStyle style,  CharacterGender gender,  CharacterAppearance appearance,  CharacterPersonality personality, @JsonKey(name: 'system_prompt')  String? systemPrompt, @JsonKey(name: 'greeting_message')  String greetingMessage,  List<String> categories, @JsonKey(name: 'chat_count')  int chatCount, @JsonKey(name: 'favorite_count')  int favoriteCount, @JsonKey(name: 'is_public')  bool isPublic, @JsonKey(name: 'is_official')  bool isOfficial, @JsonKey(name: 'is_nsfw')  bool isNsfw, @JsonKey(name: 'creator_id')  String? creatorId, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'is_favorited')  bool? isFavorited, @JsonKey(name: 'voice_id')  String? voiceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Character() when $default != null:
return $default(_that.id,_that.name,_that.tagline,_that.description,_that.avatarUrl,_that.bannerUrl,_that.style,_that.gender,_that.appearance,_that.personality,_that.systemPrompt,_that.greetingMessage,_that.categories,_that.chatCount,_that.favoriteCount,_that.isPublic,_that.isOfficial,_that.isNsfw,_that.creatorId,_that.createdAt,_that.updatedAt,_that.isFavorited,_that.voiceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? tagline,  String? description, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'banner_url')  String? bannerUrl,  CharacterStyle style,  CharacterGender gender,  CharacterAppearance appearance,  CharacterPersonality personality, @JsonKey(name: 'system_prompt')  String? systemPrompt, @JsonKey(name: 'greeting_message')  String greetingMessage,  List<String> categories, @JsonKey(name: 'chat_count')  int chatCount, @JsonKey(name: 'favorite_count')  int favoriteCount, @JsonKey(name: 'is_public')  bool isPublic, @JsonKey(name: 'is_official')  bool isOfficial, @JsonKey(name: 'is_nsfw')  bool isNsfw, @JsonKey(name: 'creator_id')  String? creatorId, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'is_favorited')  bool? isFavorited, @JsonKey(name: 'voice_id')  String? voiceId)  $default,) {final _that = this;
switch (_that) {
case _Character():
return $default(_that.id,_that.name,_that.tagline,_that.description,_that.avatarUrl,_that.bannerUrl,_that.style,_that.gender,_that.appearance,_that.personality,_that.systemPrompt,_that.greetingMessage,_that.categories,_that.chatCount,_that.favoriteCount,_that.isPublic,_that.isOfficial,_that.isNsfw,_that.creatorId,_that.createdAt,_that.updatedAt,_that.isFavorited,_that.voiceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? tagline,  String? description, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'banner_url')  String? bannerUrl,  CharacterStyle style,  CharacterGender gender,  CharacterAppearance appearance,  CharacterPersonality personality, @JsonKey(name: 'system_prompt')  String? systemPrompt, @JsonKey(name: 'greeting_message')  String greetingMessage,  List<String> categories, @JsonKey(name: 'chat_count')  int chatCount, @JsonKey(name: 'favorite_count')  int favoriteCount, @JsonKey(name: 'is_public')  bool isPublic, @JsonKey(name: 'is_official')  bool isOfficial, @JsonKey(name: 'is_nsfw')  bool isNsfw, @JsonKey(name: 'creator_id')  String? creatorId, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'is_favorited')  bool? isFavorited, @JsonKey(name: 'voice_id')  String? voiceId)?  $default,) {final _that = this;
switch (_that) {
case _Character() when $default != null:
return $default(_that.id,_that.name,_that.tagline,_that.description,_that.avatarUrl,_that.bannerUrl,_that.style,_that.gender,_that.appearance,_that.personality,_that.systemPrompt,_that.greetingMessage,_that.categories,_that.chatCount,_that.favoriteCount,_that.isPublic,_that.isOfficial,_that.isNsfw,_that.creatorId,_that.createdAt,_that.updatedAt,_that.isFavorited,_that.voiceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Character implements Character {
  const _Character({required this.id, required this.name, this.tagline, this.description, @JsonKey(name: 'avatar_url') this.avatarUrl, @JsonKey(name: 'banner_url') this.bannerUrl, this.style = CharacterStyle.anime, this.gender = CharacterGender.female, this.appearance = const CharacterAppearance(), this.personality = const CharacterPersonality(), @JsonKey(name: 'system_prompt') this.systemPrompt, @JsonKey(name: 'greeting_message') this.greetingMessage = '', final  List<String> categories = const [], @JsonKey(name: 'chat_count') this.chatCount = 0, @JsonKey(name: 'favorite_count') this.favoriteCount = 0, @JsonKey(name: 'is_public') this.isPublic = true, @JsonKey(name: 'is_official') this.isOfficial = false, @JsonKey(name: 'is_nsfw') this.isNsfw = false, @JsonKey(name: 'creator_id') this.creatorId, @JsonKey(name: 'created_at') this.createdAt = '', @JsonKey(name: 'updated_at') this.updatedAt = '', @JsonKey(name: 'is_favorited') this.isFavorited, @JsonKey(name: 'voice_id') this.voiceId}): _categories = categories;
  factory _Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? tagline;
@override final  String? description;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override@JsonKey(name: 'banner_url') final  String? bannerUrl;
@override@JsonKey() final  CharacterStyle style;
@override@JsonKey() final  CharacterGender gender;
@override@JsonKey() final  CharacterAppearance appearance;
@override@JsonKey() final  CharacterPersonality personality;
@override@JsonKey(name: 'system_prompt') final  String? systemPrompt;
@override@JsonKey(name: 'greeting_message') final  String greetingMessage;
 final  List<String> _categories;
@override@JsonKey() List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override@JsonKey(name: 'chat_count') final  int chatCount;
@override@JsonKey(name: 'favorite_count') final  int favoriteCount;
@override@JsonKey(name: 'is_public') final  bool isPublic;
@override@JsonKey(name: 'is_official') final  bool isOfficial;
@override@JsonKey(name: 'is_nsfw') final  bool isNsfw;
@override@JsonKey(name: 'creator_id') final  String? creatorId;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override@JsonKey(name: 'is_favorited') final  bool? isFavorited;
@override@JsonKey(name: 'voice_id') final  String? voiceId;

/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterCopyWith<_Character> get copyWith => __$CharacterCopyWithImpl<_Character>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CharacterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Character&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.description, description) || other.description == description)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bannerUrl, bannerUrl) || other.bannerUrl == bannerUrl)&&(identical(other.style, style) || other.style == style)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.appearance, appearance) || other.appearance == appearance)&&(identical(other.personality, personality) || other.personality == personality)&&(identical(other.systemPrompt, systemPrompt) || other.systemPrompt == systemPrompt)&&(identical(other.greetingMessage, greetingMessage) || other.greetingMessage == greetingMessage)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.chatCount, chatCount) || other.chatCount == chatCount)&&(identical(other.favoriteCount, favoriteCount) || other.favoriteCount == favoriteCount)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isOfficial, isOfficial) || other.isOfficial == isOfficial)&&(identical(other.isNsfw, isNsfw) || other.isNsfw == isNsfw)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isFavorited, isFavorited) || other.isFavorited == isFavorited)&&(identical(other.voiceId, voiceId) || other.voiceId == voiceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,tagline,description,avatarUrl,bannerUrl,style,gender,appearance,personality,systemPrompt,greetingMessage,const DeepCollectionEquality().hash(_categories),chatCount,favoriteCount,isPublic,isOfficial,isNsfw,creatorId,createdAt,updatedAt,isFavorited,voiceId]);

@override
String toString() {
  return 'Character(id: $id, name: $name, tagline: $tagline, description: $description, avatarUrl: $avatarUrl, bannerUrl: $bannerUrl, style: $style, gender: $gender, appearance: $appearance, personality: $personality, systemPrompt: $systemPrompt, greetingMessage: $greetingMessage, categories: $categories, chatCount: $chatCount, favoriteCount: $favoriteCount, isPublic: $isPublic, isOfficial: $isOfficial, isNsfw: $isNsfw, creatorId: $creatorId, createdAt: $createdAt, updatedAt: $updatedAt, isFavorited: $isFavorited, voiceId: $voiceId)';
}


}

/// @nodoc
abstract mixin class _$CharacterCopyWith<$Res> implements $CharacterCopyWith<$Res> {
  factory _$CharacterCopyWith(_Character value, $Res Function(_Character) _then) = __$CharacterCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? tagline, String? description,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'banner_url') String? bannerUrl, CharacterStyle style, CharacterGender gender, CharacterAppearance appearance, CharacterPersonality personality,@JsonKey(name: 'system_prompt') String? systemPrompt,@JsonKey(name: 'greeting_message') String greetingMessage, List<String> categories,@JsonKey(name: 'chat_count') int chatCount,@JsonKey(name: 'favorite_count') int favoriteCount,@JsonKey(name: 'is_public') bool isPublic,@JsonKey(name: 'is_official') bool isOfficial,@JsonKey(name: 'is_nsfw') bool isNsfw,@JsonKey(name: 'creator_id') String? creatorId,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'is_favorited') bool? isFavorited,@JsonKey(name: 'voice_id') String? voiceId
});


@override $CharacterAppearanceCopyWith<$Res> get appearance;@override $CharacterPersonalityCopyWith<$Res> get personality;

}
/// @nodoc
class __$CharacterCopyWithImpl<$Res>
    implements _$CharacterCopyWith<$Res> {
  __$CharacterCopyWithImpl(this._self, this._then);

  final _Character _self;
  final $Res Function(_Character) _then;

/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? tagline = freezed,Object? description = freezed,Object? avatarUrl = freezed,Object? bannerUrl = freezed,Object? style = null,Object? gender = null,Object? appearance = null,Object? personality = null,Object? systemPrompt = freezed,Object? greetingMessage = null,Object? categories = null,Object? chatCount = null,Object? favoriteCount = null,Object? isPublic = null,Object? isOfficial = null,Object? isNsfw = null,Object? creatorId = freezed,Object? createdAt = null,Object? updatedAt = null,Object? isFavorited = freezed,Object? voiceId = freezed,}) {
  return _then(_Character(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tagline: freezed == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,bannerUrl: freezed == bannerUrl ? _self.bannerUrl : bannerUrl // ignore: cast_nullable_to_non_nullable
as String?,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as CharacterStyle,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as CharacterGender,appearance: null == appearance ? _self.appearance : appearance // ignore: cast_nullable_to_non_nullable
as CharacterAppearance,personality: null == personality ? _self.personality : personality // ignore: cast_nullable_to_non_nullable
as CharacterPersonality,systemPrompt: freezed == systemPrompt ? _self.systemPrompt : systemPrompt // ignore: cast_nullable_to_non_nullable
as String?,greetingMessage: null == greetingMessage ? _self.greetingMessage : greetingMessage // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,chatCount: null == chatCount ? _self.chatCount : chatCount // ignore: cast_nullable_to_non_nullable
as int,favoriteCount: null == favoriteCount ? _self.favoriteCount : favoriteCount // ignore: cast_nullable_to_non_nullable
as int,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,isOfficial: null == isOfficial ? _self.isOfficial : isOfficial // ignore: cast_nullable_to_non_nullable
as bool,isNsfw: null == isNsfw ? _self.isNsfw : isNsfw // ignore: cast_nullable_to_non_nullable
as bool,creatorId: freezed == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,isFavorited: freezed == isFavorited ? _self.isFavorited : isFavorited // ignore: cast_nullable_to_non_nullable
as bool?,voiceId: freezed == voiceId ? _self.voiceId : voiceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterAppearanceCopyWith<$Res> get appearance {
  
  return $CharacterAppearanceCopyWith<$Res>(_self.appearance, (value) {
    return _then(_self.copyWith(appearance: value));
  });
}/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterPersonalityCopyWith<$Res> get personality {
  
  return $CharacterPersonalityCopyWith<$Res>(_self.personality, (value) {
    return _then(_self.copyWith(personality: value));
  });
}
}

// dart format on
