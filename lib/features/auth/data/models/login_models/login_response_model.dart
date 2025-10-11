import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'accessToken')
  final String accessToken;
  
  @JsonKey(name: 'expiresAtUtc')
  final DateTime expiresAtUtc;
  
  @JsonKey(name: 'refreshToken')
  final String refreshToken;

  LoginResponse({
    required this.accessToken,
    required this.expiresAtUtc,
    required this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
