import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_app/features/auth/data/repository/login_repository.dart';
import 'package:shopping_app/features/auth/data/repository/signup_repository.dart';
import 'package:shopping_app/features/auth/data/repository/otp_repository.dart';
import 'package:shopping_app/features/auth/presentation/cubit/login_cubit.dart';
import 'package:shopping_app/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:shopping_app/features/auth/presentation/cubit/otp_cubit.dart';
import 'package:shopping_app/core/network/api_service.dart';
import 'package:shopping_app/core/network/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  // Dio and Api Services
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));

  // Sign Up
  getIt.registerLazySingleton<SignUpRepository>(
    () => SignUpRepository(getIt()),
  );
  getIt.registerLazySingleton<SignUpCubit>(() => SignUpCubit(getIt()));

  // OTP
  getIt.registerLazySingleton<OtpRepository>(() => OtpRepository(getIt()));
  getIt.registerFactoryParam<OtpCubit, String, void>(
    (email, _) => OtpCubit(getIt(), email),
  );
}
