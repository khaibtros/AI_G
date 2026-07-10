// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_responses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConversationData {

 Conversation get conversation; List<Message> get messages;
/// Create a copy of ConversationData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationDataCopyWith<ConversationData> get copyWith => _$ConversationDataCopyWithImpl<ConversationData>(this as ConversationData, _$identity);

  /// Serializes this ConversationData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationData&&(identical(other.conversation, conversation) || other.conversation == conversation)&&const DeepCollectionEquality().equals(other.messages, messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conversation,const DeepCollectionEquality().hash(messages));

@override
String toString() {
  return 'ConversationData(conversation: $conversation, messages: $messages)';
}


}

/// @nodoc
abstract mixin class $ConversationDataCopyWith<$Res>  {
  factory $ConversationDataCopyWith(ConversationData value, $Res Function(ConversationData) _then) = _$ConversationDataCopyWithImpl;
@useResult
$Res call({
 Conversation conversation, List<Message> messages
});


$ConversationCopyWith<$Res> get conversation;

}
/// @nodoc
class _$ConversationDataCopyWithImpl<$Res>
    implements $ConversationDataCopyWith<$Res> {
  _$ConversationDataCopyWithImpl(this._self, this._then);

  final ConversationData _self;
  final $Res Function(ConversationData) _then;

/// Create a copy of ConversationData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversation = null,Object? messages = null,}) {
  return _then(_self.copyWith(
conversation: null == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as Conversation,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,
  ));
}
/// Create a copy of ConversationData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConversationCopyWith<$Res> get conversation {
  
  return $ConversationCopyWith<$Res>(_self.conversation, (value) {
    return _then(_self.copyWith(conversation: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConversationData].
extension ConversationDataPatterns on ConversationData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationData value)  $default,){
final _that = this;
switch (_that) {
case _ConversationData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationData value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Conversation conversation,  List<Message> messages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationData() when $default != null:
return $default(_that.conversation,_that.messages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Conversation conversation,  List<Message> messages)  $default,) {final _that = this;
switch (_that) {
case _ConversationData():
return $default(_that.conversation,_that.messages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Conversation conversation,  List<Message> messages)?  $default,) {final _that = this;
switch (_that) {
case _ConversationData() when $default != null:
return $default(_that.conversation,_that.messages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConversationData implements ConversationData {
  const _ConversationData({required this.conversation, final  List<Message> messages = const []}): _messages = messages;
  factory _ConversationData.fromJson(Map<String, dynamic> json) => _$ConversationDataFromJson(json);

@override final  Conversation conversation;
 final  List<Message> _messages;
@override@JsonKey() List<Message> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of ConversationData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationDataCopyWith<_ConversationData> get copyWith => __$ConversationDataCopyWithImpl<_ConversationData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationData&&(identical(other.conversation, conversation) || other.conversation == conversation)&&const DeepCollectionEquality().equals(other._messages, _messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conversation,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'ConversationData(conversation: $conversation, messages: $messages)';
}


}

/// @nodoc
abstract mixin class _$ConversationDataCopyWith<$Res> implements $ConversationDataCopyWith<$Res> {
  factory _$ConversationDataCopyWith(_ConversationData value, $Res Function(_ConversationData) _then) = __$ConversationDataCopyWithImpl;
@override @useResult
$Res call({
 Conversation conversation, List<Message> messages
});


@override $ConversationCopyWith<$Res> get conversation;

}
/// @nodoc
class __$ConversationDataCopyWithImpl<$Res>
    implements _$ConversationDataCopyWith<$Res> {
  __$ConversationDataCopyWithImpl(this._self, this._then);

  final _ConversationData _self;
  final $Res Function(_ConversationData) _then;

/// Create a copy of ConversationData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conversation = null,Object? messages = null,}) {
  return _then(_ConversationData(
conversation: null == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as Conversation,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,
  ));
}

/// Create a copy of ConversationData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConversationCopyWith<$Res> get conversation {
  
  return $ConversationCopyWith<$Res>(_self.conversation, (value) {
    return _then(_self.copyWith(conversation: value));
  });
}
}


/// @nodoc
mixin _$SendMessageResponse {

@JsonKey(name: 'user_message') Message get userMessage;@JsonKey(name: 'ai_message') Message get aiMessage;
/// Create a copy of SendMessageResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMessageResponseCopyWith<SendMessageResponse> get copyWith => _$SendMessageResponseCopyWithImpl<SendMessageResponse>(this as SendMessageResponse, _$identity);

  /// Serializes this SendMessageResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMessageResponse&&(identical(other.userMessage, userMessage) || other.userMessage == userMessage)&&(identical(other.aiMessage, aiMessage) || other.aiMessage == aiMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userMessage,aiMessage);

@override
String toString() {
  return 'SendMessageResponse(userMessage: $userMessage, aiMessage: $aiMessage)';
}


}

/// @nodoc
abstract mixin class $SendMessageResponseCopyWith<$Res>  {
  factory $SendMessageResponseCopyWith(SendMessageResponse value, $Res Function(SendMessageResponse) _then) = _$SendMessageResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_message') Message userMessage,@JsonKey(name: 'ai_message') Message aiMessage
});


$MessageCopyWith<$Res> get userMessage;$MessageCopyWith<$Res> get aiMessage;

}
/// @nodoc
class _$SendMessageResponseCopyWithImpl<$Res>
    implements $SendMessageResponseCopyWith<$Res> {
  _$SendMessageResponseCopyWithImpl(this._self, this._then);

  final SendMessageResponse _self;
  final $Res Function(SendMessageResponse) _then;

/// Create a copy of SendMessageResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userMessage = null,Object? aiMessage = null,}) {
  return _then(_self.copyWith(
userMessage: null == userMessage ? _self.userMessage : userMessage // ignore: cast_nullable_to_non_nullable
as Message,aiMessage: null == aiMessage ? _self.aiMessage : aiMessage // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}
/// Create a copy of SendMessageResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get userMessage {
  
  return $MessageCopyWith<$Res>(_self.userMessage, (value) {
    return _then(_self.copyWith(userMessage: value));
  });
}/// Create a copy of SendMessageResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get aiMessage {
  
  return $MessageCopyWith<$Res>(_self.aiMessage, (value) {
    return _then(_self.copyWith(aiMessage: value));
  });
}
}


/// Adds pattern-matching-related methods to [SendMessageResponse].
extension SendMessageResponsePatterns on SendMessageResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendMessageResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendMessageResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendMessageResponse value)  $default,){
final _that = this;
switch (_that) {
case _SendMessageResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendMessageResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SendMessageResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_message')  Message userMessage, @JsonKey(name: 'ai_message')  Message aiMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendMessageResponse() when $default != null:
return $default(_that.userMessage,_that.aiMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_message')  Message userMessage, @JsonKey(name: 'ai_message')  Message aiMessage)  $default,) {final _that = this;
switch (_that) {
case _SendMessageResponse():
return $default(_that.userMessage,_that.aiMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_message')  Message userMessage, @JsonKey(name: 'ai_message')  Message aiMessage)?  $default,) {final _that = this;
switch (_that) {
case _SendMessageResponse() when $default != null:
return $default(_that.userMessage,_that.aiMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendMessageResponse implements SendMessageResponse {
  const _SendMessageResponse({@JsonKey(name: 'user_message') required this.userMessage, @JsonKey(name: 'ai_message') required this.aiMessage});
  factory _SendMessageResponse.fromJson(Map<String, dynamic> json) => _$SendMessageResponseFromJson(json);

@override@JsonKey(name: 'user_message') final  Message userMessage;
@override@JsonKey(name: 'ai_message') final  Message aiMessage;

/// Create a copy of SendMessageResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendMessageResponseCopyWith<_SendMessageResponse> get copyWith => __$SendMessageResponseCopyWithImpl<_SendMessageResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendMessageResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendMessageResponse&&(identical(other.userMessage, userMessage) || other.userMessage == userMessage)&&(identical(other.aiMessage, aiMessage) || other.aiMessage == aiMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userMessage,aiMessage);

@override
String toString() {
  return 'SendMessageResponse(userMessage: $userMessage, aiMessage: $aiMessage)';
}


}

/// @nodoc
abstract mixin class _$SendMessageResponseCopyWith<$Res> implements $SendMessageResponseCopyWith<$Res> {
  factory _$SendMessageResponseCopyWith(_SendMessageResponse value, $Res Function(_SendMessageResponse) _then) = __$SendMessageResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_message') Message userMessage,@JsonKey(name: 'ai_message') Message aiMessage
});


@override $MessageCopyWith<$Res> get userMessage;@override $MessageCopyWith<$Res> get aiMessage;

}
/// @nodoc
class __$SendMessageResponseCopyWithImpl<$Res>
    implements _$SendMessageResponseCopyWith<$Res> {
  __$SendMessageResponseCopyWithImpl(this._self, this._then);

  final _SendMessageResponse _self;
  final $Res Function(_SendMessageResponse) _then;

/// Create a copy of SendMessageResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userMessage = null,Object? aiMessage = null,}) {
  return _then(_SendMessageResponse(
userMessage: null == userMessage ? _self.userMessage : userMessage // ignore: cast_nullable_to_non_nullable
as Message,aiMessage: null == aiMessage ? _self.aiMessage : aiMessage // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}

/// Create a copy of SendMessageResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get userMessage {
  
  return $MessageCopyWith<$Res>(_self.userMessage, (value) {
    return _then(_self.copyWith(userMessage: value));
  });
}/// Create a copy of SendMessageResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get aiMessage {
  
  return $MessageCopyWith<$Res>(_self.aiMessage, (value) {
    return _then(_self.copyWith(aiMessage: value));
  });
}
}


/// @nodoc
mixin _$RegenerateResponse {

@JsonKey(name: 'ai_message') Message get aiMessage;
/// Create a copy of RegenerateResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegenerateResponseCopyWith<RegenerateResponse> get copyWith => _$RegenerateResponseCopyWithImpl<RegenerateResponse>(this as RegenerateResponse, _$identity);

  /// Serializes this RegenerateResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegenerateResponse&&(identical(other.aiMessage, aiMessage) || other.aiMessage == aiMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,aiMessage);

@override
String toString() {
  return 'RegenerateResponse(aiMessage: $aiMessage)';
}


}

/// @nodoc
abstract mixin class $RegenerateResponseCopyWith<$Res>  {
  factory $RegenerateResponseCopyWith(RegenerateResponse value, $Res Function(RegenerateResponse) _then) = _$RegenerateResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ai_message') Message aiMessage
});


$MessageCopyWith<$Res> get aiMessage;

}
/// @nodoc
class _$RegenerateResponseCopyWithImpl<$Res>
    implements $RegenerateResponseCopyWith<$Res> {
  _$RegenerateResponseCopyWithImpl(this._self, this._then);

  final RegenerateResponse _self;
  final $Res Function(RegenerateResponse) _then;

/// Create a copy of RegenerateResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? aiMessage = null,}) {
  return _then(_self.copyWith(
aiMessage: null == aiMessage ? _self.aiMessage : aiMessage // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}
/// Create a copy of RegenerateResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get aiMessage {
  
  return $MessageCopyWith<$Res>(_self.aiMessage, (value) {
    return _then(_self.copyWith(aiMessage: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegenerateResponse].
extension RegenerateResponsePatterns on RegenerateResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegenerateResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegenerateResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegenerateResponse value)  $default,){
final _that = this;
switch (_that) {
case _RegenerateResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegenerateResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RegenerateResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ai_message')  Message aiMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegenerateResponse() when $default != null:
return $default(_that.aiMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ai_message')  Message aiMessage)  $default,) {final _that = this;
switch (_that) {
case _RegenerateResponse():
return $default(_that.aiMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ai_message')  Message aiMessage)?  $default,) {final _that = this;
switch (_that) {
case _RegenerateResponse() when $default != null:
return $default(_that.aiMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegenerateResponse implements RegenerateResponse {
  const _RegenerateResponse({@JsonKey(name: 'ai_message') required this.aiMessage});
  factory _RegenerateResponse.fromJson(Map<String, dynamic> json) => _$RegenerateResponseFromJson(json);

@override@JsonKey(name: 'ai_message') final  Message aiMessage;

/// Create a copy of RegenerateResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegenerateResponseCopyWith<_RegenerateResponse> get copyWith => __$RegenerateResponseCopyWithImpl<_RegenerateResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegenerateResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegenerateResponse&&(identical(other.aiMessage, aiMessage) || other.aiMessage == aiMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,aiMessage);

@override
String toString() {
  return 'RegenerateResponse(aiMessage: $aiMessage)';
}


}

/// @nodoc
abstract mixin class _$RegenerateResponseCopyWith<$Res> implements $RegenerateResponseCopyWith<$Res> {
  factory _$RegenerateResponseCopyWith(_RegenerateResponse value, $Res Function(_RegenerateResponse) _then) = __$RegenerateResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ai_message') Message aiMessage
});


@override $MessageCopyWith<$Res> get aiMessage;

}
/// @nodoc
class __$RegenerateResponseCopyWithImpl<$Res>
    implements _$RegenerateResponseCopyWith<$Res> {
  __$RegenerateResponseCopyWithImpl(this._self, this._then);

  final _RegenerateResponse _self;
  final $Res Function(_RegenerateResponse) _then;

/// Create a copy of RegenerateResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? aiMessage = null,}) {
  return _then(_RegenerateResponse(
aiMessage: null == aiMessage ? _self.aiMessage : aiMessage // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}

/// Create a copy of RegenerateResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get aiMessage {
  
  return $MessageCopyWith<$Res>(_self.aiMessage, (value) {
    return _then(_self.copyWith(aiMessage: value));
  });
}
}


/// @nodoc
mixin _$SendGiftResponse {

@JsonKey(name: 'gift_message') Message get giftMessage;@JsonKey(name: 'ai_message') Message get aiMessage; Map<String, dynamic> get gift;@JsonKey(name: 'new_balance') int get newBalance;
/// Create a copy of SendGiftResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendGiftResponseCopyWith<SendGiftResponse> get copyWith => _$SendGiftResponseCopyWithImpl<SendGiftResponse>(this as SendGiftResponse, _$identity);

  /// Serializes this SendGiftResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendGiftResponse&&(identical(other.giftMessage, giftMessage) || other.giftMessage == giftMessage)&&(identical(other.aiMessage, aiMessage) || other.aiMessage == aiMessage)&&const DeepCollectionEquality().equals(other.gift, gift)&&(identical(other.newBalance, newBalance) || other.newBalance == newBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,giftMessage,aiMessage,const DeepCollectionEquality().hash(gift),newBalance);

@override
String toString() {
  return 'SendGiftResponse(giftMessage: $giftMessage, aiMessage: $aiMessage, gift: $gift, newBalance: $newBalance)';
}


}

/// @nodoc
abstract mixin class $SendGiftResponseCopyWith<$Res>  {
  factory $SendGiftResponseCopyWith(SendGiftResponse value, $Res Function(SendGiftResponse) _then) = _$SendGiftResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'gift_message') Message giftMessage,@JsonKey(name: 'ai_message') Message aiMessage, Map<String, dynamic> gift,@JsonKey(name: 'new_balance') int newBalance
});


$MessageCopyWith<$Res> get giftMessage;$MessageCopyWith<$Res> get aiMessage;

}
/// @nodoc
class _$SendGiftResponseCopyWithImpl<$Res>
    implements $SendGiftResponseCopyWith<$Res> {
  _$SendGiftResponseCopyWithImpl(this._self, this._then);

  final SendGiftResponse _self;
  final $Res Function(SendGiftResponse) _then;

/// Create a copy of SendGiftResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? giftMessage = null,Object? aiMessage = null,Object? gift = null,Object? newBalance = null,}) {
  return _then(_self.copyWith(
giftMessage: null == giftMessage ? _self.giftMessage : giftMessage // ignore: cast_nullable_to_non_nullable
as Message,aiMessage: null == aiMessage ? _self.aiMessage : aiMessage // ignore: cast_nullable_to_non_nullable
as Message,gift: null == gift ? _self.gift : gift // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,newBalance: null == newBalance ? _self.newBalance : newBalance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of SendGiftResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get giftMessage {
  
  return $MessageCopyWith<$Res>(_self.giftMessage, (value) {
    return _then(_self.copyWith(giftMessage: value));
  });
}/// Create a copy of SendGiftResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get aiMessage {
  
  return $MessageCopyWith<$Res>(_self.aiMessage, (value) {
    return _then(_self.copyWith(aiMessage: value));
  });
}
}


/// Adds pattern-matching-related methods to [SendGiftResponse].
extension SendGiftResponsePatterns on SendGiftResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendGiftResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendGiftResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendGiftResponse value)  $default,){
final _that = this;
switch (_that) {
case _SendGiftResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendGiftResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SendGiftResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'gift_message')  Message giftMessage, @JsonKey(name: 'ai_message')  Message aiMessage,  Map<String, dynamic> gift, @JsonKey(name: 'new_balance')  int newBalance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendGiftResponse() when $default != null:
return $default(_that.giftMessage,_that.aiMessage,_that.gift,_that.newBalance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'gift_message')  Message giftMessage, @JsonKey(name: 'ai_message')  Message aiMessage,  Map<String, dynamic> gift, @JsonKey(name: 'new_balance')  int newBalance)  $default,) {final _that = this;
switch (_that) {
case _SendGiftResponse():
return $default(_that.giftMessage,_that.aiMessage,_that.gift,_that.newBalance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'gift_message')  Message giftMessage, @JsonKey(name: 'ai_message')  Message aiMessage,  Map<String, dynamic> gift, @JsonKey(name: 'new_balance')  int newBalance)?  $default,) {final _that = this;
switch (_that) {
case _SendGiftResponse() when $default != null:
return $default(_that.giftMessage,_that.aiMessage,_that.gift,_that.newBalance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendGiftResponse implements SendGiftResponse {
  const _SendGiftResponse({@JsonKey(name: 'gift_message') required this.giftMessage, @JsonKey(name: 'ai_message') required this.aiMessage, required final  Map<String, dynamic> gift, @JsonKey(name: 'new_balance') required this.newBalance}): _gift = gift;
  factory _SendGiftResponse.fromJson(Map<String, dynamic> json) => _$SendGiftResponseFromJson(json);

@override@JsonKey(name: 'gift_message') final  Message giftMessage;
@override@JsonKey(name: 'ai_message') final  Message aiMessage;
 final  Map<String, dynamic> _gift;
@override Map<String, dynamic> get gift {
  if (_gift is EqualUnmodifiableMapView) return _gift;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_gift);
}

@override@JsonKey(name: 'new_balance') final  int newBalance;

/// Create a copy of SendGiftResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendGiftResponseCopyWith<_SendGiftResponse> get copyWith => __$SendGiftResponseCopyWithImpl<_SendGiftResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendGiftResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendGiftResponse&&(identical(other.giftMessage, giftMessage) || other.giftMessage == giftMessage)&&(identical(other.aiMessage, aiMessage) || other.aiMessage == aiMessage)&&const DeepCollectionEquality().equals(other._gift, _gift)&&(identical(other.newBalance, newBalance) || other.newBalance == newBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,giftMessage,aiMessage,const DeepCollectionEquality().hash(_gift),newBalance);

@override
String toString() {
  return 'SendGiftResponse(giftMessage: $giftMessage, aiMessage: $aiMessage, gift: $gift, newBalance: $newBalance)';
}


}

/// @nodoc
abstract mixin class _$SendGiftResponseCopyWith<$Res> implements $SendGiftResponseCopyWith<$Res> {
  factory _$SendGiftResponseCopyWith(_SendGiftResponse value, $Res Function(_SendGiftResponse) _then) = __$SendGiftResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'gift_message') Message giftMessage,@JsonKey(name: 'ai_message') Message aiMessage, Map<String, dynamic> gift,@JsonKey(name: 'new_balance') int newBalance
});


@override $MessageCopyWith<$Res> get giftMessage;@override $MessageCopyWith<$Res> get aiMessage;

}
/// @nodoc
class __$SendGiftResponseCopyWithImpl<$Res>
    implements _$SendGiftResponseCopyWith<$Res> {
  __$SendGiftResponseCopyWithImpl(this._self, this._then);

  final _SendGiftResponse _self;
  final $Res Function(_SendGiftResponse) _then;

/// Create a copy of SendGiftResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? giftMessage = null,Object? aiMessage = null,Object? gift = null,Object? newBalance = null,}) {
  return _then(_SendGiftResponse(
giftMessage: null == giftMessage ? _self.giftMessage : giftMessage // ignore: cast_nullable_to_non_nullable
as Message,aiMessage: null == aiMessage ? _self.aiMessage : aiMessage // ignore: cast_nullable_to_non_nullable
as Message,gift: null == gift ? _self._gift : gift // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,newBalance: null == newBalance ? _self.newBalance : newBalance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of SendGiftResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get giftMessage {
  
  return $MessageCopyWith<$Res>(_self.giftMessage, (value) {
    return _then(_self.copyWith(giftMessage: value));
  });
}/// Create a copy of SendGiftResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get aiMessage {
  
  return $MessageCopyWith<$Res>(_self.aiMessage, (value) {
    return _then(_self.copyWith(aiMessage: value));
  });
}
}

// dart format on
