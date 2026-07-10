// Memory Fact Model

import 'package:freezed_annotation/freezed_annotation.dart';

part 'memory_fact.freezed.dart';
part 'memory_fact.g.dart';

@freezed
abstract class MemoryFact with _$MemoryFact {
  const factory MemoryFact({
    required String key,
    required String value,
    @Default(0.0) double confidence,
  }) = _MemoryFact;

  factory MemoryFact.fromJson(Map<String, dynamic> json) =>
      _$MemoryFactFromJson(json);
}
