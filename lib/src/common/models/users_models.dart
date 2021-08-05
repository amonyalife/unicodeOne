import 'package:json_annotation/json_annotation.dart';

part 'users_models.g.dart';

@JsonSerializable()
class UserModel {
  final String email;
  final String? nickname;
  final String? phone;
  final String? password;

  UserModel({
    required this.email,
    this.password,
    required this.nickname,
    this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
