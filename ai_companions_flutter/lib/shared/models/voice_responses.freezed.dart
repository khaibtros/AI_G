// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_responses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VoiceResponse {

@JsonKey(name: 'audioUrl') String get audioUrl;@JsonKey(name: 'newBalance') int? get newBalance;
/// Create a copy of VoiceResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoiceResponseCopyWith<VoiceResponse> get copyWith => _$VoiceResponseCopyWithImpl<VoiceResponse>(this as VoiceResponse, _$identity);

  /// Serializes this VoiceResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceResponse&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&(identical(other.newBalance, newBalance) || other.newBalance == newBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,audioUrl,newBalance);

@override
String toString() {
  return 'VoiceResponse(audioUrl: $audioUrl, newBalance: $newBalance)';
}


}

/// @nodoc
abstract mixin class $VoiceResponseCopyWith<$Res>  {
  factory $VoiceResponseCopyWith(VoiceResponse value, $Res Function(VoiceResponse) _then) = _$VoiceResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'audioUrl') String audioUrl,@JsonKey(name: 'newBalance') int? newBalance
});




}
/// @nodoc
class _$VoiceResponseCopyWithImpl<$Res>
    implements $VoiceResponseCopyWith<$Res> {
  _$VoiceResponseCopyWithImpl(this._self, this._then);

  final VoiceResponse _self;
  final $Res Function(VoiceResponse) _then;

/// Create a copy of VoiceResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? audioUrl = null,Object? newBalance = freezed,}) {
  return _then(_self.copyWith(
audioUrl: null == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String,newBalance: freezed == newBalance ? _self.newBalance : newBalance // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [VoiceResponse].
extension VoiceResponsePatterns on VoiceResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoiceResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoiceResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoiceResponse value)  $default,){
final _that = this;
switch (_that) {
case _VoiceResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoiceResponse value)?  $default,){
final _that = this;
switch (_that) {
case _VoiceResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'audioUrl')  String audioUrl, @JsonKey(name: 'newBalance')  int? newBalance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoiceResponse() when $default != null:
return $default(_that.audioUrl,_that.newBalance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'audioUrl')  String audioUrl, @JsonKey(name: 'newBalance')  int? newBalance)  $default,) {final _that = this;
switch (_that) {
case _VoiceResponse():
return $default(_that.audioUrl,_that.newBalance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'audioUrl')  String audioUrl, @JsonKey(name: 'newBalance')  int? newBalance)?  $default,) {final _that = this;
switch (_that) {
case _VoiceResponse() when $default != null:
return $default(_that.audioUrl,_that.newBalance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VoiceResponse implements VoiceResponse {
  const _VoiceResponse({@JsonKey(name: 'audioUrl') required this.audioUrl, @JsonKey(name: 'newBalance') this.newBalance});
  factory _VoiceResponse.fromJson(Map<String, dynamic> json) => _$VoiceResponseFromJson(json);

@override@JsonKey(name: 'audioUrl') final  String audioUrl;
@override@JsonKey(name: 'newBalance') final  int? newBalance;

/// Create a copy of VoiceResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoiceResponseCopyWith<_VoiceResponse> get copyWith => __$VoiceResponseCopyWithImpl<_VoiceResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoiceResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoiceResponse&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&(identical(other.newBalance, newBalance) || other.newBalance == newBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,audioUrl,newBalance);

@override
String toString() {
  return 'VoiceResponse(audioUrl: $audioUrl, newBalance: $newBalance)';
}


}

/// @nodoc
abstract mixin class _$VoiceResponseCopyWith<$Res> implements $VoiceResponseCopyWith<$Res> {
  factory _$VoiceResponseCopyWith(_VoiceResponse value, $Res Function(_VoiceResponse) _then) = __$VoiceResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'audioUrl') String audioUrl,@JsonKey(name: 'newBalance') int? newBalance
});




}
/// @nodoc
class __$VoiceResponseCopyWithImpl<$Res>
    implements _$VoiceResponseCopyWith<$Res> {
  __$VoiceResponseCopyWithImpl(this._self, this._then);

  final _VoiceResponse _self;
  final $Res Function(_VoiceResponse) _then;

/// Create a copy of VoiceResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? audioUrl = null,Object? newBalance = freezed,}) {
  return _then(_VoiceResponse(
audioUrl: null == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String,newBalance: freezed == newBalance ? _self.newBalance : newBalance // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
