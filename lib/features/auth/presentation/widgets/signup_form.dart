import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/widgets/labeled_text_field.dart';
import 'package:shopping_app/core/utils/validation_utils.dart';
import 'package:shopping_app/features/auth/presentation/cubit/signup_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          // First Name Field
          LabeledTextField(
            label: "First Name",
            controller: context.read<SignUpCubit>().firstNameController,
            validator: ValidationUtils.validateName,
          ),

          SizedBox(height: 25.h),

          // Last Name Field
          LabeledTextField(
            label: "Last Name",
            controller: context.read<SignUpCubit>().lastNameController,
            validator: ValidationUtils.validateName,
          ),

          SizedBox(height: 25.h),

          // Email Field
          LabeledTextField(
            label: "Email Address",
            keyboardType: TextInputType.emailAddress,
            controller: context.read<SignUpCubit>().emailController,
            validator: ValidationUtils.validateEmail,
          ),

          SizedBox(height: 25.h),

          // Password Field
          LabeledTextField(
            label: "Password",
            obscureText: isObscurePassword,
            controller: context.read<SignUpCubit>().passwordController,
            validator: ValidationUtils.validatePassword,
          ),

          SizedBox(height: 25.h),

          // Confirm Password Field
          LabeledTextField(
            label: "Confirm Password",
            obscureText: isObscureConfirmPassword,
            controller: context.read<SignUpCubit>().confirmPasswordController,
            validator: (value) => ValidationUtils.validateConfirmPassword(
              context.read<SignUpCubit>().passwordController.text,
              value,
            ),
          ),
        ],
      ),
    );
  }
}
