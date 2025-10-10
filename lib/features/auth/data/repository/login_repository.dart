import 'package:shopping_app/core/network/api_error_handler.dart';
import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/core/network/api_service.dart';
import 'package:shopping_app/features/auth/data/model/login_request_model.dart';
import 'package:shopping_app/features/auth/data/model/login_response_model.dart';

class LoginRepository {
  final ApiService _apiService;

  LoginRepository(this._apiService);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestModel loginRequestModel) async {
    try {
      final response = await _apiService.login(loginRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      final errorMessage = ApiErrorHandler.getErrorMessage(error);
      return ApiResult.failure(errorMessage);
    }
  }
}