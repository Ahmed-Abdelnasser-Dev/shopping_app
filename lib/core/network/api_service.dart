import 'package:dio/dio.dart';
import 'package:shopping_app/core/network/api_constants.dart';
import 'package:shopping_app/features/auth/data/models/login_models/login_request_model.dart';
import 'package:shopping_app/features/auth/data/models/login_models/login_response_model.dart';
import 'package:shopping_app/features/auth/data/models/otp_models/otp_request_model.dart';
import 'package:shopping_app/features/auth/data/models/otp_models/resend_otp_request_model.dart';
import 'package:shopping_app/features/auth/data/models/refresh_token_models/refresh_token_request_model.dart';
import 'package:shopping_app/features/auth/data/models/refresh_token_models/refresh_token_response_model.dart';
import 'package:shopping_app/features/auth/data/models/signup_models/signup_request_model.dart';
import 'package:shopping_app/features/auth/data/models/signup_models/signup_response_model.dart';

class UnifiedApiService {
  final Dio _dio;

  UnifiedApiService(this._dio);

  // Auth endpoints
  Future<LoginResponse> login(LoginRequestModel loginRequest) async {
    final response = await _dio.post(ApiConstants.signIn, data: loginRequest.toJson());
    return LoginResponse.fromJson(response.data);
  }

  Future<SignUpResponse> signUp(SignUpRequestModel signUpRequest) async {
    final response = await _dio.post(ApiConstants.signUp, data: signUpRequest.toJson());
    return SignUpResponse.fromJson(response.data);
  }

  Future<String> verifyEmail(OtpRequestModel otpRequest) async {
    final response = await _dio.post(ApiConstants.verifyEmail, data: otpRequest.toJson());
    return response.data as String;
  }

  Future<String> resendOtp(ResendOtpRequestModel resendOtpRequest) async {
    final response = await _dio.post(ApiConstants.resendOtp, data: resendOtpRequest.toJson());
    return response.data as String;
  }

  Future<RefreshTokenResponseModel> refreshToken(RefreshTokenRequestModel refreshTokenRequest) async {
    final response = await _dio.post(ApiConstants.refreshToken, data: refreshTokenRequest.toJson());
    return RefreshTokenResponseModel.fromJson(response.data);
  }

  Future<void> logout() async {
    await _dio.post(ApiConstants.logOut);
  }

  // Home endpoints
  Future<Map<String, dynamic>> getBrands() async {
    final response = await _dio.get(ApiConstants.categories);
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getProducts(Map<String, dynamic> params) async {
    final response = await _dio.get(ApiConstants.products, queryParameters: params);
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getProductById(String id) async {
    final response = await _dio.get('${ApiConstants.productById}/$id');
    return response.data as Map<String, dynamic>;
  }

  Future<void> toggleFavorite(String id) async {
    await _dio.post('${ApiConstants.products}/$id/favorite');
  }
}
