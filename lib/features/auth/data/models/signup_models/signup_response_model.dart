import 'package:json_annotation/json_annotation.dart';

part '../signup_response_model.g.dart';

@JsonSerializable()
class SignUpResponse {
  final String message;

  SignUpResponse({required this.message});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}
