// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Message {

 String get id;@JsonKey(name: 'conversation_id') String get conversationId;@JsonKey(name: 'sender_type') SenderType get senderType;@JsonKey(name: 'character_id') String? get characterId; MessageCharacter? get character; String get content;@JsonKey(name: 'media_url') String? get mediaUrl;@JsonKey(name: 'audio_url') String? get audioUrl;@JsonKey(name: 'token_count') int get tokenCount;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageCopyWith<Message> get copyWith => _$MessageCopyWithImpl<Message>(this as Message, _$identity);

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Message&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.senderType, senderType) || other.senderType == senderType)&&(identical(other.characterId, characterId) || other.characterId == characterId)&&(identical(other.character, character) || other.character == character)&&(identical(other.content, content) || other.content == content)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&(identical(other.tokenCount, tokenCount) || other.tokenCount == tokenCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,conversationId,senderType,characterId,character,content,mediaUrl,audioUrl,tokenCount,createdAt);

@override
String toString() {
  return 'Message(id: $id, conversationId: $conversationId, senderType: $senderType, characterId: $characterId, character: $character, content: $content, mediaUrl: $mediaUrl, audioUrl: $audioUrl, tokenCount: $tokenCount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MessageCopyWith<$Res>  {
  factory $MessageCopyWith(Message value, $Res Function(Message) _then) = _$MessageCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'conversation_id') String conversationId,@JsonKey(name: 'sender_type') SenderType senderType,@JsonKey(name: 'character_id') String? characterId, MessageCharacter? character, String content,@JsonKey(name: 'media_url') String? mediaUrl,@JsonKey(name: 'audio_url') String? audioUrl,@JsonKey(name: 'token_count') int tokenCount,@JsonKey(name: 'created_at') String createdAt
});


$MessageCharacterCopyWith<$Res>? get character;

}
/// @nodoc
class _$MessageCopyWithImpl<$Res>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._self, this._then);

  final Message _self;
  final $Res Function(Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? conversationId = null,Object? senderType = null,Object? characterId = freezed,Object? character = freezed,Object? content = null,Object? mediaUrl = freezed,Object? audioUrl = freezed,Object? tokenCount = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,senderType: null == senderType ? _self.senderType : senderType // ignore: cast_nullable_to_non_nullable
as SenderType,characterId: freezed == characterId ? _self.characterId : characterId // ignore: cast_nullable_to_non_nullable
as String?,character: freezed == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as MessageCharacter?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,mediaUrl: freezed == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String?,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,tokenCount: null == tokenCount ? _self.tokenCount : tokenCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCharacterCopyWith<$Res>? get character {
    if (_self.character == null) {
    return null;
  }

  return $MessageCharacterCopyWith<$Res>(_self.character!, (value) {
    return _then(_self.copyWith(character: value));
  });
}
}


/// Adds pattern-matching-related methods to [Message].
extension MessagePatterns on Message {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Message value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Message() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Message value)  $default,){
final _that = this;
switch (_that) {
case _Message():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Message value)?  $default,){
final _that = this;
switch (_that) {
case _Message() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'conversation_id')  String conversationId, @JsonKey(name: 'sender_type')  SenderType senderType, @JsonKey(name: 'character_id')  String? characterId,  MessageCharacter? character,  String content, @JsonKey(name: 'media_url')  String? mediaUrl, @JsonKey(name: 'audio_url')  String? audioUrl, @JsonKey(name: 'token_count')  int tokenCount, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that.id,_that.conversationId,_that.senderType,_that.characterId,_that.character,_that.content,_that.mediaUrl,_that.audioUrl,_that.tokenCount,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'conversation_id')  String conversationId, @JsonKey(name: 'sender_type')  SenderType senderType, @JsonKey(name: 'character_id')  String? characterId,  MessageCharacter? character,  String content, @JsonKey(name: 'media_url')  String? mediaUrl, @JsonKey(name: 'audio_url')  String? audioUrl, @JsonKey(name: 'token_count')  int tokenCount, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _Message():
return $default(_that.id,_that.conversationId,_that.senderType,_that.characterId,_that.character,_that.content,_that.mediaUrl,_that.audioUrl,_that.tokenCount,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'conversation_id')  String conversationId, @JsonKey(name: 'sender_type')  SenderType senderType, @JsonKey(name: 'character_id')  String? characterId,  MessageCharacter? character,  String content, @JsonKey(name: 'media_url')  String? mediaUrl, @JsonKey(name: 'audio_url')  String? audioUrl, @JsonKey(name: 'token_count')  int tokenCount, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that.id,_that.conversationId,_that.senderType,_that.characterId,_that.character,_that.content,_that.mediaUrl,_that.audioUrl,_that.tokenCount,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Message implements Message {
  const _Message({required this.id, @JsonKey(name: 'conversation_id') required this.conversationId, @JsonKey(name: 'sender_type') required this.senderType, @JsonKey(name: 'character_id') this.characterId, this.character, required this.content, @JsonKey(name: 'media_url') this.mediaUrl, @JsonKey(name: 'audio_url') this.audioUrl, @JsonKey(name: 'token_count') this.tokenCount = 0, @JsonKey(name: 'created_at') required this.createdAt});
  factory _Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

@override final  String id;
@override@JsonKey(name: 'conversation_id') final  String conversationId;
@override@JsonKey(name: 'sender_type') final  SenderType senderType;
@override@JsonKey(name: 'character_id') final  String? characterId;
@override final  MessageCharacter? character;
@override final  String content;
@override@JsonKey(name: 'media_url') final  String? mediaUrl;
@override@JsonKey(name: 'audio_url') final  String? audioUrl;
@override@JsonKey(name: 'token_count') final  int tokenCount;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageCopyWith<_Message> get copyWith => __$MessageCopyWithImpl<_Message>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Message&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.senderType, senderType) || other.senderType == senderType)&&(identical(other.characterId, characterId) || other.characterId == characterId)&&(identical(other.character, character) || other.character == character)&&(identical(other.content, content) || other.content == content)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&(identical(other.tokenCount, tokenCount) || other.tokenCount == tokenCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,conversationId,senderType,characterId,character,content,mediaUrl,audioUrl,tokenCount,createdAt);

@override
String toString() {
  return 'Message(id: $id, conversationId: $conversationId, senderType: $senderType, characterId: $characterId, character: $character, content: $content, mediaUrl: $mediaUrl, audioUrl: $audioUrl, tokenCount: $tokenCount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) _then) = __$MessageCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'conversation_id') String conversationId,@JsonKey(name: 'sender_type') SenderType senderType,@JsonKey(name: 'character_id') String? characterId, MessageCharacter? character, String content,@JsonKey(name: 'media_url') String? mediaUrl,@JsonKey(name: 'audio_url') String? audioUrl,@JsonKey(name: 'token_count') int tokenCount,@JsonKey(name: 'created_at') String createdAt
});


@override $MessageCharacterCopyWith<$Res>? get character;

}
/// @nodoc
class __$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(this._self, this._then);

  final _Message _self;
  final $Res Function(_Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? conversationId = null,Object? senderType = null,Object? characterId = freezed,Object? character = freezed,Object? content = null,Object? mediaUrl = freezed,Object? audioUrl = freezed,Object? tokenCount = null,Object? createdAt = null,}) {
  return _then(_Message(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,senderType: null == senderType ? _self.senderType : senderType // ignore: cast_nullable_to_non_nullable
as SenderType,characterId: freezed == characterId ? _self.characterId : characterId // ignore: cast_nullable_to_non_nullable
as String?,character: freezed == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as MessageCharacter?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,mediaUrl: freezed == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String?,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,tokenCount: null == tokenCount ? _self.tokenCount : tokenCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCharacterCopyWith<$Res>? get character {
    if (_self.character == null) {
    return null;
  }

  return $MessageCharacterCopyWith<$Res>(_self.character!, (value) {
    return _then(_self.copyWith(character: value));
  });
}
}


/// @nodoc
mixin _$MessageCharacter {

 String get id; String get name;@JsonKey(name: 'avatar_url') String? get avatarUrl;@JsonKey(name: 'voice_id') String? get voiceId;
/// Create a copy of MessageCharacter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageCharacterCopyWith<MessageCharacter> get copyWith => _$MessageCharacterCopyWithImpl<MessageCharacter>(this as MessageCharacter, _$identity);

  /// Serializes this MessageCharacter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageCharacter&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.voiceId, voiceId) || other.voiceId == voiceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarUrl,voiceId);

@override
String toString() {
  return 'MessageCharacter(id: $id, name: $name, avatarUrl: $avatarUrl, voiceId: $voiceId)';
}


}

/// @nodoc
abstract mixin class $MessageCharacterCopyWith<$Res>  {
  factory $MessageCharacterCopyWith(MessageCharacter value, $Res Function(MessageCharacter) _then) = _$MessageCharacterCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'voice_id') String? voiceId
});




}
/// @nodoc
class _$MessageCharacterCopyWithImpl<$Res>
    implements $MessageCharacterCopyWith<$Res> {
  _$MessageCharacterCopyWithImpl(this._self, this._then);

  final MessageCharacter _self;
  final $Res Function(MessageCharacter) _then;

/// Create a copy of MessageCharacter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? avatarUrl = freezed,Object? voiceId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,voiceId: freezed == voiceId ? _self.voiceId : voiceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageCharacter].
extension MessageCharacterPatterns on MessageCharacter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageCharacter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageCharacter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageCharacter value)  $default,){
final _that = this;
switch (_that) {
case _MessageCharacter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageCharacter value)?  $default,){
final _that = this;
switch (_that) {
case _MessageCharacter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'voice_id')  String? voiceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageCharacter() when $default != null:
return $default(_that.id,_that.name,_that.avatarUrl,_that.voiceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'voice_id')  String? voiceId)  $default,) {final _that = this;
switch (_that) {
case _MessageCharacter():
return $default(_that.id,_that.name,_that.avatarUrl,_that.voiceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'voice_id')  String? voiceId)?  $default,) {final _that = this;
switch (_that) {
case _MessageCharacter() when $default != null:
return $default(_that.id,_that.name,_that.avatarUrl,_that.voiceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageCharacter implements MessageCharacter {
  const _MessageCharacter({required this.id, required this.name, @JsonKey(name: 'avatar_url') this.avatarUrl, @JsonKey(name: 'voice_id') this.voiceId});
  factory _MessageCharacter.fromJson(Map<String, dynamic> json) => _$MessageCharacterFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override@JsonKey(name: 'voice_id') final  String? voiceId;

/// Create a copy of MessageCharacter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageCharacterCopyWith<_MessageCharacter> get copyWith => __$MessageCharacterCopyWithImpl<_MessageCharacter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageCharacterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageCharacter&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.voiceId, voiceId) || other.voiceId == voiceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarUrl,voiceId);

@override
String toString() {
  return 'MessageCharacter(id: $id, name: $name, avatarUrl: $avatarUrl, voiceId: $voiceId)';
}


}

/// @nodoc
abstract mixin class _$MessageCharacterCopyWith<$Res> implements $MessageCharacterCopyWith<$Res> {
  factory _$MessageCharacterCopyWith(_MessageCharacter value, $Res Function(_MessageCharacter) _then) = __$MessageCharacterCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'voice_id') String? voiceId
});




}
/// @nodoc
class __$MessageCharacterCopyWithImpl<$Res>
    implements _$MessageCharacterCopyWith<$Res> {
  __$MessageCharacterCopyWithImpl(this._self, this._then);

  final _MessageCharacter _self;
  final $Res Function(_MessageCharacter) _then;

/// Create a copy of MessageCharacter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatarUrl = freezed,Object? voiceId = freezed,}) {
  return _then(_MessageCharacter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,voiceId: freezed == voiceId ? _self.voiceId : voiceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
