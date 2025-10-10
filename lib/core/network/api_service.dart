
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopping_app/features/auth/data/model/login_request_model.dart';
import 'package:shopping_app/features/auth/data/model/login_response_model.dart';
import 'package:shopping_app/core/network/api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.signIn)
  Future<LoginResponse> login(
    @Body() LoginRequestModel loginRequest,
  );
}