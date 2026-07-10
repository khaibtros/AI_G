import 'package:freezed_annotation/freezed_annotation.dart';

part 'gift.freezed.dart';
part 'gift.g.dart';

@freezed
abstract class Gift with _$Gift {
  const factory Gift({
    required String id,
    required String name,
    required int price,
    required String imageUrl,
  }) = _Gift;

  factory Gift.fromJson(Map<String, dynamic> json) => _$GiftFromJson(json);
}
