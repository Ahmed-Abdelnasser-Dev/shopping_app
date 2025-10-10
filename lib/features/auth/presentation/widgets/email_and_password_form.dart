import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/widgets/labeled_text_field.dart';
import 'package:shopping_app/features/auth/presentation/cubit/login_cubit.dart';
import 'package:shopping_app/features/auth/presentation/widgets/password_validations.dart';

class EmailAndPasswordForm extends StatefulWidget {
  const EmailAndPasswordForm({super.key});

  @override
  State<EmailAndPasswordForm> createState() => _EmailAndPasswordFormState();
}

class _EmailAndPasswordFormState extends State<EmailAndPasswordForm> {
  bool isObscure = true;

  late TextEditingController passwordController;

  final bool hasUppercase = false;
  final bool hasLowercase = false;
  final bool hasNumbers = false;
  final bool hasSpecialCharacters = false;
  final bool isLongEnough = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          // Email
          LabeledTextField(
            label: "Email",
            keyboardType: TextInputType.emailAddress,
            controller: context.read<LoginCubit>().emailController,

            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
            },
          ),

          SizedBox(height: 25.h),

          // Password
          LabeledTextField(
            label: "Password",
            obscureText: isObscure,
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
            },
          ),
          SizedBox(height: 10.h),
          PasswordValidations(
            hasUppercase: hasUppercase,
            hasLowercase: hasLowercase,
            hasNumbers: hasNumbers,
            hasSpecialCharacters: hasSpecialCharacters,
            isLongEnough: isLongEnough,
          ),
        ],
      ),
    );
  }
}
