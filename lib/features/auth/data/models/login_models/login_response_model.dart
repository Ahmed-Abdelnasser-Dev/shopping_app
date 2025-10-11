import 'package:json_annotation/json_annotation.dart';

part '../login_response_model.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'statusCode')
  final int? statusCode;
  final String? message;
  final String? token;
  final String? refreshToken;
  final DateTime? expiration;
  final Map<String, List<String>>? errors;

  LoginResponse({
    this.statusCode,
    this.message,
    this.token,
    this.refreshToken,
    this.expiration,
    this.errors,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
