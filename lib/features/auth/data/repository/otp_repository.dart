import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/core/network/api_service.dart';
import 'package:shopping_app/features/auth/data/models/otp_models/otp_request_model.dart';
import 'package:shopping_app/features/auth/data/models/otp_models/otp_response_model.dart';
import 'package:shopping_app/features/auth/data/models/otp_models/resend_otp_request_model.dart';

class OtpRepository {
  final UnifiedApiService _apiService;

  OtpRepository(this._apiService);

  Future<ApiResult<OtpResponseModel>> verifyEmail(
    OtpRequestModel otpRequest,
  ) async {
    try {
      final message = await _apiService.verifyEmail(otpRequest);
      return ApiResult.success(OtpResponseModel(message: message));
    } catch (error) {
      final errMsg = error.toString();
      return ApiResult.failure(errMsg);
    }
  }

  Future<ApiResult<OtpResponseModel>> resendOtp(
    ResendOtpRequestModel resendOtpRequest,
  ) async {
    try {
      final response = await _apiService.resendOtp(resendOtpRequest);
      return ApiResult.success(OtpResponseModel(message: response));
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
