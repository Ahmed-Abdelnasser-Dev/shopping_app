import 'package:shopping_app/core/network/api_error_handler.dart';
import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/core/network/api_service.dart';
import 'package:shopping_app/features/auth/data/models/signup_models/signup_request_model.dart';
import 'package:shopping_app/features/auth/data/models/signup_models/signup_response_model.dart';

class SignUpRepository {
  final ApiService _apiService;

  SignUpRepository(this._apiService);

  Future<ApiResult<SignUpResponse>> signUp(
    SignUpRequestModel signUpRequestModel,
  ) async {
    try {
      final response = await _apiService.signUp(signUpRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      final errorMessage = ApiErrorHandler.getErrorMessage(error);
      return ApiResult.failure(errorMessage);
    }
  }
}
