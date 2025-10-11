import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopping_app/core/network/api_constants.dart';
import 'package:shopping_app/features/auth/data/models/login_models/login_request_model.dart';
import 'package:shopping_app/features/auth/data/models/login_models/login_response_model.dart';
import 'package:shopping_app/features/auth/data/models/otp_models/otp_request_model.dart';
import 'package:shopping_app/features/auth/data/models/otp_models/otp_response_model.dart';
import 'package:shopping_app/features/auth/data/models/otp_models/resend_otp_request_model.dart';
import 'package:shopping_app/features/auth/data/models/signup_models/signup_request_model.dart';
import 'package:shopping_app/features/auth/data/models/signup_models/signup_response_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.signIn)
  Future<LoginResponse> login(@Body() LoginRequestModel loginRequest);

  @POST(ApiConstants.signUp)
  Future<SignUpResponse> signUp(@Body() SignUpRequestModel signUpRequest);

  @POST(ApiConstants.verifyEmail)
  Future<String> verifyEmail(@Body() OtpRequestModel otpRequest);

  @POST(ApiConstants.resendOtp)
  Future<OtpResponseModel> resendOtp(
    @Body() ResendOtpRequestModel resendOtpRequest,
  );
}
