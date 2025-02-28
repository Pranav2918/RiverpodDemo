import 'package:freezed_annotation/freezed_annotation.dart';
part 'photo.g.dart';
part 'photo.freezed.dart';

@freezed
class Photo with _$Photo {
  const factory Photo({
    required String id,
    required String author,
    required int width,
    required int height,
    @JsonKey(name: "download_url") required String downloadUrl,
    required String url,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
