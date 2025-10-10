import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/widgets/labeled_text_field.dart';
import 'package:shopping_app/core/utils/validation_utils.dart';
import 'package:shopping_app/features/auth/presentation/cubit/login_cubit.dart';

class EmailAndPasswordForm extends StatefulWidget {
  const EmailAndPasswordForm({super.key});

  @override
  State<EmailAndPasswordForm> createState() => _EmailAndPasswordFormState();
}

class _EmailAndPasswordFormState extends State<EmailAndPasswordForm> {
  bool isObscure = true;
  late TextEditingController passwordController;

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
            validator: ValidationUtils.validateEmail,
          ),

          SizedBox(height: 25.h),

          // Password
          LabeledTextField(
            label: "Password",
            obscureText: isObscure,
            controller: context.read<LoginCubit>().passwordController,
            validator: ValidationUtils.validatePassword,
          ),
        ],
      ),
    );
  }
}
