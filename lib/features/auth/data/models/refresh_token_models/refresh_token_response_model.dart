import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_response_model.g.dart';

@JsonSerializable()
class RefreshTokenResponseModel {
  @JsonKey(name: 'accessToken')
  final String accessToken;
  
  @JsonKey(name: 'expiresAtUtc')
  final DateTime expiresAtUtc;
  
  @JsonKey(name: 'refreshToken')
  final String refreshToken;

  RefreshTokenResponseModel({
    required this.accessToken,
    required this.expiresAtUtc,
    required this.refreshToken,
  });

  factory RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenResponseModelToJson(this);
}
