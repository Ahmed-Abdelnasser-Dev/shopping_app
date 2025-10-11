import 'package:shopping_app/core/network/api_error_handler.dart';
import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/core/network/api_service.dart';

class LogoutRepository {
  final UnifiedApiService _apiService;

  LogoutRepository(this._apiService);

  Future<ApiResult<void>> logout() async {
    try {
      await _apiService.logout();
      return const ApiResult.success(null);
    } catch (error) {
      final errorMessage = ApiErrorHandler.getErrorMessage(error);
      return ApiResult.failure(errorMessage);
    }
  }
}
