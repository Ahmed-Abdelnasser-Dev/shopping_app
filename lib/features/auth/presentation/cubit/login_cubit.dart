
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/auth/data/model/login_request_model.dart';
import 'package:shopping_app/features/auth/data/repository/login_repository.dart';
import 'package:shopping_app/features/auth/presentation/cubit/login_state.dart';
import 'package:shopping_app/core/network/api_result.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  LoginCubit(this._loginRepository) : super( const LoginState.initial());

  void emitLoginStates(LoginRequestModel loginRequest) async {
    emit(const LoginState.loading());
    final response = await _loginRepository.login(loginRequest);

    response.when(success: (loginResponse) async {
      emit(LoginState.success(loginResponse));
    }, failure:(error) {

      //TODO Implement Real Error Handling
      emit(LoginState.failure(error));
    });
  }
}
 