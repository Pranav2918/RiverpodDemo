import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart'; // Required for freezed code
part 'user.g.dart';       // Required for JSON serialization

@freezed
class User with _$User {

  const factory User({
    required int id,
    required String name,
    required String email
}) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}