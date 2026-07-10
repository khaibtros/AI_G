// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generation_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenerationRequest {

 String get id;@JsonKey(name: 'user_id') String get userId; String get prompt; String? get style; GenerationStatus get status;@JsonKey(name: 'result_url') String? get resultUrl;@JsonKey(name: 'coin_cost') int get coinCost;@JsonKey(name: 'error_message') String? get errorMessage;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;
/// Create a copy of GenerationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerationRequestCopyWith<GenerationRequest> get copyWith => _$GenerationRequestCopyWithImpl<GenerationRequest>(this as GenerationRequest, _$identity);

  /// Serializes this GenerationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerationRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.style, style) || other.style == style)&&(identical(other.status, status) || other.status == status)&&(identical(other.resultUrl, resultUrl) || other.resultUrl == resultUrl)&&(identical(other.coinCost, coinCost) || other.coinCost == coinCost)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,prompt,style,status,resultUrl,coinCost,errorMessage,createdAt,updatedAt);

@override
String toString() {
  return 'GenerationRequest(id: $id, userId: $userId, prompt: $prompt, style: $style, status: $status, resultUrl: $resultUrl, coinCost: $coinCost, errorMessage: $errorMessage, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $GenerationRequestCopyWith<$Res>  {
  factory $GenerationRequestCopyWith(GenerationRequest value, $Res Function(GenerationRequest) _then) = _$GenerationRequestCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId, String prompt, String? style, GenerationStatus status,@JsonKey(name: 'result_url') String? resultUrl,@JsonKey(name: 'coin_cost') int coinCost,@JsonKey(name: 'error_message') String? errorMessage,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class _$GenerationRequestCopyWithImpl<$Res>
    implements $GenerationRequestCopyWith<$Res> {
  _$GenerationRequestCopyWithImpl(this._self, this._then);

  final GenerationRequest _self;
  final $Res Function(GenerationRequest) _then;

/// Create a copy of GenerationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? prompt = null,Object? style = freezed,Object? status = null,Object? resultUrl = freezed,Object? coinCost = null,Object? errorMessage = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GenerationStatus,resultUrl: freezed == resultUrl ? _self.resultUrl : resultUrl // ignore: cast_nullable_to_non_nullable
as String?,coinCost: null == coinCost ? _self.coinCost : coinCost // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GenerationRequest].
extension GenerationRequestPatterns on GenerationRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenerationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenerationRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenerationRequest value)  $default,){
final _that = this;
switch (_that) {
case _GenerationRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenerationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _GenerationRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId,  String prompt,  String? style,  GenerationStatus status, @JsonKey(name: 'result_url')  String? resultUrl, @JsonKey(name: 'coin_cost')  int coinCost, @JsonKey(name: 'error_message')  String? errorMessage, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenerationRequest() when $default != null:
return $default(_that.id,_that.userId,_that.prompt,_that.style,_that.status,_that.resultUrl,_that.coinCost,_that.errorMessage,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId,  String prompt,  String? style,  GenerationStatus status, @JsonKey(name: 'result_url')  String? resultUrl, @JsonKey(name: 'coin_cost')  int coinCost, @JsonKey(name: 'error_message')  String? errorMessage, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _GenerationRequest():
return $default(_that.id,_that.userId,_that.prompt,_that.style,_that.status,_that.resultUrl,_that.coinCost,_that.errorMessage,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId,  String prompt,  String? style,  GenerationStatus status, @JsonKey(name: 'result_url')  String? resultUrl, @JsonKey(name: 'coin_cost')  int coinCost, @JsonKey(name: 'error_message')  String? errorMessage, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _GenerationRequest() when $default != null:
return $default(_that.id,_that.userId,_that.prompt,_that.style,_that.status,_that.resultUrl,_that.coinCost,_that.errorMessage,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenerationRequest implements GenerationRequest {
  const _GenerationRequest({required this.id, @JsonKey(name: 'user_id') required this.userId, required this.prompt, this.style, required this.status, @JsonKey(name: 'result_url') this.resultUrl, @JsonKey(name: 'coin_cost') required this.coinCost, @JsonKey(name: 'error_message') this.errorMessage, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _GenerationRequest.fromJson(Map<String, dynamic> json) => _$GenerationRequestFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override final  String prompt;
@override final  String? style;
@override final  GenerationStatus status;
@override@JsonKey(name: 'result_url') final  String? resultUrl;
@override@JsonKey(name: 'coin_cost') final  int coinCost;
@override@JsonKey(name: 'error_message') final  String? errorMessage;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;

/// Create a copy of GenerationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerationRequestCopyWith<_GenerationRequest> get copyWith => __$GenerationRequestCopyWithImpl<_GenerationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerationRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.style, style) || other.style == style)&&(identical(other.status, status) || other.status == status)&&(identical(other.resultUrl, resultUrl) || other.resultUrl == resultUrl)&&(identical(other.coinCost, coinCost) || other.coinCost == coinCost)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,prompt,style,status,resultUrl,coinCost,errorMessage,createdAt,updatedAt);

@override
String toString() {
  return 'GenerationRequest(id: $id, userId: $userId, prompt: $prompt, style: $style, status: $status, resultUrl: $resultUrl, coinCost: $coinCost, errorMessage: $errorMessage, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$GenerationRequestCopyWith<$Res> implements $GenerationRequestCopyWith<$Res> {
  factory _$GenerationRequestCopyWith(_GenerationRequest value, $Res Function(_GenerationRequest) _then) = __$GenerationRequestCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId, String prompt, String? style, GenerationStatus status,@JsonKey(name: 'result_url') String? resultUrl,@JsonKey(name: 'coin_cost') int coinCost,@JsonKey(name: 'error_message') String? errorMessage,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class __$GenerationRequestCopyWithImpl<$Res>
    implements _$GenerationRequestCopyWith<$Res> {
  __$GenerationRequestCopyWithImpl(this._self, this._then);

  final _GenerationRequest _self;
  final $Res Function(_GenerationRequest) _then;

/// Create a copy of GenerationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? prompt = null,Object? style = freezed,Object? status = null,Object? resultUrl = freezed,Object? coinCost = null,Object? errorMessage = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_GenerationRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GenerationStatus,resultUrl: freezed == resultUrl ? _self.resultUrl : resultUrl // ignore: cast_nullable_to_non_nullable
as String?,coinCost: null == coinCost ? _self.coinCost : coinCost // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
