// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Conversation {

 String get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'character_id') String get characterId;@JsonKey(name: 'last_message_at') String get lastMessageAt;@JsonKey(name: 'last_message_preview') String? get lastMessagePreview;@JsonKey(name: 'message_count') int get messageCount;@JsonKey(name: 'memory_summary') String? get memorySummary;@JsonKey(name: 'memory_facts') List<MemoryFact> get memoryFacts;@JsonKey(name: 'is_group') bool get isGroup;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt; Character? get character;
/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationCopyWith<Conversation> get copyWith => _$ConversationCopyWithImpl<Conversation>(this as Conversation, _$identity);

  /// Serializes this Conversation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Conversation&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.characterId, characterId) || other.characterId == characterId)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.lastMessagePreview, lastMessagePreview) || other.lastMessagePreview == lastMessagePreview)&&(identical(other.messageCount, messageCount) || other.messageCount == messageCount)&&(identical(other.memorySummary, memorySummary) || other.memorySummary == memorySummary)&&const DeepCollectionEquality().equals(other.memoryFacts, memoryFacts)&&(identical(other.isGroup, isGroup) || other.isGroup == isGroup)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.character, character) || other.character == character));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,characterId,lastMessageAt,lastMessagePreview,messageCount,memorySummary,const DeepCollectionEquality().hash(memoryFacts),isGroup,createdAt,updatedAt,character);

@override
String toString() {
  return 'Conversation(id: $id, userId: $userId, characterId: $characterId, lastMessageAt: $lastMessageAt, lastMessagePreview: $lastMessagePreview, messageCount: $messageCount, memorySummary: $memorySummary, memoryFacts: $memoryFacts, isGroup: $isGroup, createdAt: $createdAt, updatedAt: $updatedAt, character: $character)';
}


}

/// @nodoc
abstract mixin class $ConversationCopyWith<$Res>  {
  factory $ConversationCopyWith(Conversation value, $Res Function(Conversation) _then) = _$ConversationCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'character_id') String characterId,@JsonKey(name: 'last_message_at') String lastMessageAt,@JsonKey(name: 'last_message_preview') String? lastMessagePreview,@JsonKey(name: 'message_count') int messageCount,@JsonKey(name: 'memory_summary') String? memorySummary,@JsonKey(name: 'memory_facts') List<MemoryFact> memoryFacts,@JsonKey(name: 'is_group') bool isGroup,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt, Character? character
});


$CharacterCopyWith<$Res>? get character;

}
/// @nodoc
class _$ConversationCopyWithImpl<$Res>
    implements $ConversationCopyWith<$Res> {
  _$ConversationCopyWithImpl(this._self, this._then);

  final Conversation _self;
  final $Res Function(Conversation) _then;

/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? characterId = null,Object? lastMessageAt = null,Object? lastMessagePreview = freezed,Object? messageCount = null,Object? memorySummary = freezed,Object? memoryFacts = null,Object? isGroup = null,Object? createdAt = null,Object? updatedAt = null,Object? character = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,characterId: null == characterId ? _self.characterId : characterId // ignore: cast_nullable_to_non_nullable
as String,lastMessageAt: null == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as String,lastMessagePreview: freezed == lastMessagePreview ? _self.lastMessagePreview : lastMessagePreview // ignore: cast_nullable_to_non_nullable
as String?,messageCount: null == messageCount ? _self.messageCount : messageCount // ignore: cast_nullable_to_non_nullable
as int,memorySummary: freezed == memorySummary ? _self.memorySummary : memorySummary // ignore: cast_nullable_to_non_nullable
as String?,memoryFacts: null == memoryFacts ? _self.memoryFacts : memoryFacts // ignore: cast_nullable_to_non_nullable
as List<MemoryFact>,isGroup: null == isGroup ? _self.isGroup : isGroup // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,character: freezed == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as Character?,
  ));
}
/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterCopyWith<$Res>? get character {
    if (_self.character == null) {
    return null;
  }

  return $CharacterCopyWith<$Res>(_self.character!, (value) {
    return _then(_self.copyWith(character: value));
  });
}
}


/// Adds pattern-matching-related methods to [Conversation].
extension ConversationPatterns on Conversation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Conversation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Conversation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Conversation value)  $default,){
final _that = this;
switch (_that) {
case _Conversation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Conversation value)?  $default,){
final _that = this;
switch (_that) {
case _Conversation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'character_id')  String characterId, @JsonKey(name: 'last_message_at')  String lastMessageAt, @JsonKey(name: 'last_message_preview')  String? lastMessagePreview, @JsonKey(name: 'message_count')  int messageCount, @JsonKey(name: 'memory_summary')  String? memorySummary, @JsonKey(name: 'memory_facts')  List<MemoryFact> memoryFacts, @JsonKey(name: 'is_group')  bool isGroup, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt,  Character? character)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Conversation() when $default != null:
return $default(_that.id,_that.userId,_that.characterId,_that.lastMessageAt,_that.lastMessagePreview,_that.messageCount,_that.memorySummary,_that.memoryFacts,_that.isGroup,_that.createdAt,_that.updatedAt,_that.character);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'character_id')  String characterId, @JsonKey(name: 'last_message_at')  String lastMessageAt, @JsonKey(name: 'last_message_preview')  String? lastMessagePreview, @JsonKey(name: 'message_count')  int messageCount, @JsonKey(name: 'memory_summary')  String? memorySummary, @JsonKey(name: 'memory_facts')  List<MemoryFact> memoryFacts, @JsonKey(name: 'is_group')  bool isGroup, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt,  Character? character)  $default,) {final _that = this;
switch (_that) {
case _Conversation():
return $default(_that.id,_that.userId,_that.characterId,_that.lastMessageAt,_that.lastMessagePreview,_that.messageCount,_that.memorySummary,_that.memoryFacts,_that.isGroup,_that.createdAt,_that.updatedAt,_that.character);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'character_id')  String characterId, @JsonKey(name: 'last_message_at')  String lastMessageAt, @JsonKey(name: 'last_message_preview')  String? lastMessagePreview, @JsonKey(name: 'message_count')  int messageCount, @JsonKey(name: 'memory_summary')  String? memorySummary, @JsonKey(name: 'memory_facts')  List<MemoryFact> memoryFacts, @JsonKey(name: 'is_group')  bool isGroup, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt,  Character? character)?  $default,) {final _that = this;
switch (_that) {
case _Conversation() when $default != null:
return $default(_that.id,_that.userId,_that.characterId,_that.lastMessageAt,_that.lastMessagePreview,_that.messageCount,_that.memorySummary,_that.memoryFacts,_that.isGroup,_that.createdAt,_that.updatedAt,_that.character);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Conversation implements Conversation {
  const _Conversation({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'character_id') required this.characterId, @JsonKey(name: 'last_message_at') required this.lastMessageAt, @JsonKey(name: 'last_message_preview') this.lastMessagePreview, @JsonKey(name: 'message_count') this.messageCount = 0, @JsonKey(name: 'memory_summary') this.memorySummary, @JsonKey(name: 'memory_facts') final  List<MemoryFact> memoryFacts = const [], @JsonKey(name: 'is_group') this.isGroup = false, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, this.character}): _memoryFacts = memoryFacts;
  factory _Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'character_id') final  String characterId;
@override@JsonKey(name: 'last_message_at') final  String lastMessageAt;
@override@JsonKey(name: 'last_message_preview') final  String? lastMessagePreview;
@override@JsonKey(name: 'message_count') final  int messageCount;
@override@JsonKey(name: 'memory_summary') final  String? memorySummary;
 final  List<MemoryFact> _memoryFacts;
@override@JsonKey(name: 'memory_facts') List<MemoryFact> get memoryFacts {
  if (_memoryFacts is EqualUnmodifiableListView) return _memoryFacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_memoryFacts);
}

@override@JsonKey(name: 'is_group') final  bool isGroup;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override final  Character? character;

/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationCopyWith<_Conversation> get copyWith => __$ConversationCopyWithImpl<_Conversation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Conversation&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.characterId, characterId) || other.characterId == characterId)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.lastMessagePreview, lastMessagePreview) || other.lastMessagePreview == lastMessagePreview)&&(identical(other.messageCount, messageCount) || other.messageCount == messageCount)&&(identical(other.memorySummary, memorySummary) || other.memorySummary == memorySummary)&&const DeepCollectionEquality().equals(other._memoryFacts, _memoryFacts)&&(identical(other.isGroup, isGroup) || other.isGroup == isGroup)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.character, character) || other.character == character));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,characterId,lastMessageAt,lastMessagePreview,messageCount,memorySummary,const DeepCollectionEquality().hash(_memoryFacts),isGroup,createdAt,updatedAt,character);

@override
String toString() {
  return 'Conversation(id: $id, userId: $userId, characterId: $characterId, lastMessageAt: $lastMessageAt, lastMessagePreview: $lastMessagePreview, messageCount: $messageCount, memorySummary: $memorySummary, memoryFacts: $memoryFacts, isGroup: $isGroup, createdAt: $createdAt, updatedAt: $updatedAt, character: $character)';
}


}

/// @nodoc
abstract mixin class _$ConversationCopyWith<$Res> implements $ConversationCopyWith<$Res> {
  factory _$ConversationCopyWith(_Conversation value, $Res Function(_Conversation) _then) = __$ConversationCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'character_id') String characterId,@JsonKey(name: 'last_message_at') String lastMessageAt,@JsonKey(name: 'last_message_preview') String? lastMessagePreview,@JsonKey(name: 'message_count') int messageCount,@JsonKey(name: 'memory_summary') String? memorySummary,@JsonKey(name: 'memory_facts') List<MemoryFact> memoryFacts,@JsonKey(name: 'is_group') bool isGroup,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt, Character? character
});


@override $CharacterCopyWith<$Res>? get character;

}
/// @nodoc
class __$ConversationCopyWithImpl<$Res>
    implements _$ConversationCopyWith<$Res> {
  __$ConversationCopyWithImpl(this._self, this._then);

  final _Conversation _self;
  final $Res Function(_Conversation) _then;

/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? characterId = null,Object? lastMessageAt = null,Object? lastMessagePreview = freezed,Object? messageCount = null,Object? memorySummary = freezed,Object? memoryFacts = null,Object? isGroup = null,Object? createdAt = null,Object? updatedAt = null,Object? character = freezed,}) {
  return _then(_Conversation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,characterId: null == characterId ? _self.characterId : characterId // ignore: cast_nullable_to_non_nullable
as String,lastMessageAt: null == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as String,lastMessagePreview: freezed == lastMessagePreview ? _self.lastMessagePreview : lastMessagePreview // ignore: cast_nullable_to_non_nullable
as String?,messageCount: null == messageCount ? _self.messageCount : messageCount // ignore: cast_nullable_to_non_nullable
as int,memorySummary: freezed == memorySummary ? _self.memorySummary : memorySummary // ignore: cast_nullable_to_non_nullable
as String?,memoryFacts: null == memoryFacts ? _self._memoryFacts : memoryFacts // ignore: cast_nullable_to_non_nullable
as List<MemoryFact>,isGroup: null == isGroup ? _self.isGroup : isGroup // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,character: freezed == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as Character?,
  ));
}

/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterCopyWith<$Res>? get character {
    if (_self.character == null) {
    return null;
  }

  return $CharacterCopyWith<$Res>(_self.character!, (value) {
    return _then(_self.copyWith(character: value));
  });
}
}

// dart format on
