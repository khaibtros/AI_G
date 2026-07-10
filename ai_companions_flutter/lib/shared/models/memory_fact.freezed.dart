// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memory_fact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemoryFact {

 String get key; String get value; double get confidence;
/// Create a copy of MemoryFact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemoryFactCopyWith<MemoryFact> get copyWith => _$MemoryFactCopyWithImpl<MemoryFact>(this as MemoryFact, _$identity);

  /// Serializes this MemoryFact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemoryFact&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value)&&(identical(other.confidence, confidence) || other.confidence == confidence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,value,confidence);

@override
String toString() {
  return 'MemoryFact(key: $key, value: $value, confidence: $confidence)';
}


}

/// @nodoc
abstract mixin class $MemoryFactCopyWith<$Res>  {
  factory $MemoryFactCopyWith(MemoryFact value, $Res Function(MemoryFact) _then) = _$MemoryFactCopyWithImpl;
@useResult
$Res call({
 String key, String value, double confidence
});




}
/// @nodoc
class _$MemoryFactCopyWithImpl<$Res>
    implements $MemoryFactCopyWith<$Res> {
  _$MemoryFactCopyWithImpl(this._self, this._then);

  final MemoryFact _self;
  final $Res Function(MemoryFact) _then;

/// Create a copy of MemoryFact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? value = null,Object? confidence = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MemoryFact].
extension MemoryFactPatterns on MemoryFact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemoryFact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemoryFact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemoryFact value)  $default,){
final _that = this;
switch (_that) {
case _MemoryFact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemoryFact value)?  $default,){
final _that = this;
switch (_that) {
case _MemoryFact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String value,  double confidence)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemoryFact() when $default != null:
return $default(_that.key,_that.value,_that.confidence);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String value,  double confidence)  $default,) {final _that = this;
switch (_that) {
case _MemoryFact():
return $default(_that.key,_that.value,_that.confidence);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String value,  double confidence)?  $default,) {final _that = this;
switch (_that) {
case _MemoryFact() when $default != null:
return $default(_that.key,_that.value,_that.confidence);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MemoryFact implements MemoryFact {
  const _MemoryFact({required this.key, required this.value, this.confidence = 0.0});
  factory _MemoryFact.fromJson(Map<String, dynamic> json) => _$MemoryFactFromJson(json);

@override final  String key;
@override final  String value;
@override@JsonKey() final  double confidence;

/// Create a copy of MemoryFact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemoryFactCopyWith<_MemoryFact> get copyWith => __$MemoryFactCopyWithImpl<_MemoryFact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemoryFactToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemoryFact&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value)&&(identical(other.confidence, confidence) || other.confidence == confidence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,value,confidence);

@override
String toString() {
  return 'MemoryFact(key: $key, value: $value, confidence: $confidence)';
}


}

/// @nodoc
abstract mixin class _$MemoryFactCopyWith<$Res> implements $MemoryFactCopyWith<$Res> {
  factory _$MemoryFactCopyWith(_MemoryFact value, $Res Function(_MemoryFact) _then) = __$MemoryFactCopyWithImpl;
@override @useResult
$Res call({
 String key, String value, double confidence
});




}
/// @nodoc
class __$MemoryFactCopyWithImpl<$Res>
    implements _$MemoryFactCopyWith<$Res> {
  __$MemoryFactCopyWithImpl(this._self, this._then);

  final _MemoryFact _self;
  final $Res Function(_MemoryFact) _then;

/// Create a copy of MemoryFact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? value = null,Object? confidence = null,}) {
  return _then(_MemoryFact(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
