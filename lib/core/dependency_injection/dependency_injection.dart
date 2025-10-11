import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_app/features/auth/data/repository/login_repository.dart';
import 'package:shopping_app/features/auth/data/repository/signup_repository.dart';
import 'package:shopping_app/features/auth/data/repository/otp_repository.dart';
import 'package:shopping_app/features/auth/data/repository/refresh_token_repository.dart';
import 'package:shopping_app/features/auth/data/repository/logout_repository.dart';
import 'package:shopping_app/features/auth/presentation/cubit/login_cubit.dart';
import 'package:shopping_app/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:shopping_app/features/auth/presentation/cubit/otp_cubit.dart';
import 'package:shopping_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shopping_app/core/network/api_service.dart';
import 'package:shopping_app/core/network/dio_factory.dart';
import 'package:shopping_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:shopping_app/features/home/data/repositories/home_repository.dart';
import 'package:shopping_app/features/home/domain/repositories/home_repository.dart';
import 'package:shopping_app/features/home/presentation/cubit/home_cubit.dart';


final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  // Dio and Api Services
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<UnifiedApiService>(() => UnifiedApiService(dio));

  // Repositories
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt<UnifiedApiService>()));
  getIt.registerLazySingleton<SignUpRepository>(() => SignUpRepository(getIt<UnifiedApiService>()));
  getIt.registerLazySingleton<OtpRepository>(() => OtpRepository(getIt<UnifiedApiService>()));
  getIt.registerLazySingleton<RefreshTokenRepository>(() => RefreshTokenRepository(getIt<UnifiedApiService>()));
  getIt.registerLazySingleton<LogoutRepository>(() => LogoutRepository(getIt<UnifiedApiService>()));

  // Home Data Sources
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(getIt<UnifiedApiService>()),
  );

  // Home Repositories
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt<HomeRemoteDataSource>()),
  );

  // Auth Cubit (Global)
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt(), getIt()));

  // Feature Cubits
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt(), getIt()));
  getIt.registerLazySingleton<SignUpCubit>(() => SignUpCubit(getIt()));
  getIt.registerFactoryParam<OtpCubit, String, void>(
    (email, _) => OtpCubit(getIt(), email),
  );
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt<HomeRepository>()));
}
