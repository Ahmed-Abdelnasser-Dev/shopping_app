import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/auth/data/models/login_models/login_request_model.dart';
import 'package:shopping_app/features/auth/data/repository/login_repository.dart';
import 'package:shopping_app/features/auth/presentation/cubit/login_state.dart';
import 'package:shopping_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shopping_app/core/network/api_result.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;
  final AuthCubit _authCubit;

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginCubit(this._loginRepository, this._authCubit) : super(const LoginState.initial());

  void emitLoginStates(LoginRequestModel loginRequest) async {
    emit(const LoginState.loading());
    final response = await _loginRepository.login(loginRequest);

    response.when(
      success: (loginResponse) async {
        // Store tokens and user data through AuthCubit
        await _authCubit.onLoginSuccess(
          accessToken: loginResponse.accessToken,
          refreshToken: loginResponse.refreshToken,
          expiresAt: loginResponse.expiresAtUtc,
          email: loginRequest.email,
          firstName: '', 
          lastName: '',
        );
        
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.failure(error));
      },
    );
  }
}
