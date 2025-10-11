import 'package:shopping_app/core/network/api_error_handler.dart';
import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/core/network/api_service.dart';
import 'package:shopping_app/features/auth/data/models/refresh_token_models/refresh_token_request_model.dart';
import 'package:shopping_app/features/auth/data/models/refresh_token_models/refresh_token_response_model.dart';

class RefreshTokenRepository {
  final UnifiedApiService _apiService;

  RefreshTokenRepository(this._apiService);

  Future<ApiResult<RefreshTokenResponseModel>> refreshToken(
    RefreshTokenRequestModel refreshTokenRequest,
  ) async {
    try {
      final response = await _apiService.refreshToken(refreshTokenRequest);
      return ApiResult.success(response);
    } catch (error) {
      final errorMessage = ApiErrorHandler.getErrorMessage(error);
      return ApiResult.failure(errorMessage);
    }
  }
}
