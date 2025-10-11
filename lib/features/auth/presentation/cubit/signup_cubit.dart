import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/auth/data/models/signup_models/signup_request_model.dart';
import 'package:shopping_app/features/auth/data/repository/signup_repository.dart';
import 'package:shopping_app/features/auth/presentation/cubit/signup_state.dart';
import 'package:shopping_app/core/network/api_result.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepository _signUpRepository;

  final formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  SignUpCubit(this._signUpRepository) : super(const SignUpState.initial());

  void emitSignUpStates(SignUpRequestModel signUpRequest) async {
    emit(const SignUpState.loading());

    final response = await _signUpRepository.signUp(signUpRequest);

    response.when(
      success: (signUpResponse) {
        emit(SignUpState.success(signUpResponse));
      },
      failure: (error) {
        emit(SignUpState.failure(error));
      },
    );
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
