import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_app/features/auth/data/models/otp_models/otp_response_model.dart';

part 'otp_state.freezed.dart';

@freezed
class OtpState with _$OtpState {
  const factory OtpState.initial() = _Initial;
  const factory OtpState.loading() = _Loading;
  const factory OtpState.success(OtpResponseModel otpResponse) = _Success;
  const factory OtpState.failure(String error) = _Failure;
  const factory OtpState.resendLoading() = _ResendLoading;
  const factory OtpState.resendSuccess(OtpResponseModel otpResponse) =
      _ResendSuccess;
  const factory OtpState.resendFailure(String error) = _ResendFailure;
}
