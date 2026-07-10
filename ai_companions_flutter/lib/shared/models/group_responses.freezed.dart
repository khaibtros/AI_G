// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_responses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroupMessageResponse {

@JsonKey(name: 'user_message') Message get userMessage;@JsonKey(name: 'ai_messages') List<Message> get aiMessages;
/// Create a copy of GroupMessageResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupMessageResponseCopyWith<GroupMessageResponse> get copyWith => _$GroupMessageResponseCopyWithImpl<GroupMessageResponse>(this as GroupMessageResponse, _$identity);

  /// Serializes this GroupMessageResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupMessageResponse&&(identical(other.userMessage, userMessage) || other.userMessage == userMessage)&&const DeepCollectionEquality().equals(other.aiMessages, aiMessages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userMessage,const DeepCollectionEquality().hash(aiMessages));

@override
String toString() {
  return 'GroupMessageResponse(userMessage: $userMessage, aiMessages: $aiMessages)';
}


}

/// @nodoc
abstract mixin class $GroupMessageResponseCopyWith<$Res>  {
  factory $GroupMessageResponseCopyWith(GroupMessageResponse value, $Res Function(GroupMessageResponse) _then) = _$GroupMessageResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_message') Message userMessage,@JsonKey(name: 'ai_messages') List<Message> aiMessages
});


$MessageCopyWith<$Res> get userMessage;

}
/// @nodoc
class _$GroupMessageResponseCopyWithImpl<$Res>
    implements $GroupMessageResponseCopyWith<$Res> {
  _$GroupMessageResponseCopyWithImpl(this._self, this._then);

  final GroupMessageResponse _self;
  final $Res Function(GroupMessageResponse) _then;

/// Create a copy of GroupMessageResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userMessage = null,Object? aiMessages = null,}) {
  return _then(_self.copyWith(
userMessage: null == userMessage ? _self.userMessage : userMessage // ignore: cast_nullable_to_non_nullable
as Message,aiMessages: null == aiMessages ? _self.aiMessages : aiMessages // ignore: cast_nullable_to_non_nullable
as List<Message>,
  ));
}
/// Create a copy of GroupMessageResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get userMessage {
  
  return $MessageCopyWith<$Res>(_self.userMessage, (value) {
    return _then(_self.copyWith(userMessage: value));
  });
}
}


/// Adds pattern-matching-related methods to [GroupMessageResponse].
extension GroupMessageResponsePatterns on GroupMessageResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroupMessageResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroupMessageResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroupMessageResponse value)  $default,){
final _that = this;
switch (_that) {
case _GroupMessageResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroupMessageResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GroupMessageResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_message')  Message userMessage, @JsonKey(name: 'ai_messages')  List<Message> aiMessages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroupMessageResponse() when $default != null:
return $default(_that.userMessage,_that.aiMessages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_message')  Message userMessage, @JsonKey(name: 'ai_messages')  List<Message> aiMessages)  $default,) {final _that = this;
switch (_that) {
case _GroupMessageResponse():
return $default(_that.userMessage,_that.aiMessages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_message')  Message userMessage, @JsonKey(name: 'ai_messages')  List<Message> aiMessages)?  $default,) {final _that = this;
switch (_that) {
case _GroupMessageResponse() when $default != null:
return $default(_that.userMessage,_that.aiMessages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GroupMessageResponse implements GroupMessageResponse {
  const _GroupMessageResponse({@JsonKey(name: 'user_message') required this.userMessage, @JsonKey(name: 'ai_messages') required final  List<Message> aiMessages}): _aiMessages = aiMessages;
  factory _GroupMessageResponse.fromJson(Map<String, dynamic> json) => _$GroupMessageResponseFromJson(json);

@override@JsonKey(name: 'user_message') final  Message userMessage;
 final  List<Message> _aiMessages;
@override@JsonKey(name: 'ai_messages') List<Message> get aiMessages {
  if (_aiMessages is EqualUnmodifiableListView) return _aiMessages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_aiMessages);
}


/// Create a copy of GroupMessageResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupMessageResponseCopyWith<_GroupMessageResponse> get copyWith => __$GroupMessageResponseCopyWithImpl<_GroupMessageResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroupMessageResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupMessageResponse&&(identical(other.userMessage, userMessage) || other.userMessage == userMessage)&&const DeepCollectionEquality().equals(other._aiMessages, _aiMessages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userMessage,const DeepCollectionEquality().hash(_aiMessages));

@override
String toString() {
  return 'GroupMessageResponse(userMessage: $userMessage, aiMessages: $aiMessages)';
}


}

/// @nodoc
abstract mixin class _$GroupMessageResponseCopyWith<$Res> implements $GroupMessageResponseCopyWith<$Res> {
  factory _$GroupMessageResponseCopyWith(_GroupMessageResponse value, $Res Function(_GroupMessageResponse) _then) = __$GroupMessageResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_message') Message userMessage,@JsonKey(name: 'ai_messages') List<Message> aiMessages
});


@override $MessageCopyWith<$Res> get userMessage;

}
/// @nodoc
class __$GroupMessageResponseCopyWithImpl<$Res>
    implements _$GroupMessageResponseCopyWith<$Res> {
  __$GroupMessageResponseCopyWithImpl(this._self, this._then);

  final _GroupMessageResponse _self;
  final $Res Function(_GroupMessageResponse) _then;

/// Create a copy of GroupMessageResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userMessage = null,Object? aiMessages = null,}) {
  return _then(_GroupMessageResponse(
userMessage: null == userMessage ? _self.userMessage : userMessage // ignore: cast_nullable_to_non_nullable
as Message,aiMessages: null == aiMessages ? _self._aiMessages : aiMessages // ignore: cast_nullable_to_non_nullable
as List<Message>,
  ));
}

/// Create a copy of GroupMessageResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get userMessage {
  
  return $MessageCopyWith<$Res>(_self.userMessage, (value) {
    return _then(_self.copyWith(userMessage: value));
  });
}
}

// dart format on
