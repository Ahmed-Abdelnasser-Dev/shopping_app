import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/dependency_injection/dependency_injection.dart';
import 'package:shopping_app/core/routes/route_helper_extensions.dart';
import 'package:shopping_app/core/routes/routes.dart';
import 'package:shopping_app/core/theme/colors.dart';
import 'package:shopping_app/core/theme/spacing.dart';
import 'package:shopping_app/core/theme/text_styles.dart';
import 'package:shopping_app/core/widgets/bottom_button.dart';
import 'package:shopping_app/core/widgets/main_app_bar.dart';
import 'package:shopping_app/features/auth/data/models/signup_models/signup_request_model.dart';
import 'package:shopping_app/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:shopping_app/features/auth/presentation/widgets/signup_form.dart';
import 'package:shopping_app/features/auth/presentation/widgets/bloc_listeners/signup_bloc_listener.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignUpCubit>(),
      child: const _SignUpView(),
    );
  }
}

class _SignUpView extends StatefulWidget {
  const _SignUpView();

  @override
  State<_SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<_SignUpView> {
  // Remember me toggle
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(showBackButton: false, showCartButton: false,),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.generalHorizontalPadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyles.h2.copyWith(color: ColorManger.black),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Create your account to continue",
                        style: TextStyles.b3.copyWith(color: ColorManger.grey),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 50.h),

                // Sign Up Form
                const SignUpForm(),

                SizedBox(height: 40.h),

                // Remember Me Switch
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Remember me",
                      style: TextStyles.b3.copyWith(color: ColorManger.black),
                    ),
                    Switch(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value;
                        });
                      },
                      trackOutlineWidth: WidgetStatePropertyAll(0.0),
                      inactiveThumbColor: ColorManger.grey,
                      inactiveTrackColor: ColorManger.grey.withAlpha(
                        (0.4 * 255).round(),
                      ),
                      activeThumbColor: ColorManger.successGreen,
                      activeTrackColor: ColorManger.successGreen.withAlpha(
                        (0.4 * 255).round(),
                      ),
                    ),
                  ],
                ),

                const SignUpBlocListener(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // account already exists text
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyles.b4.copyWith(
                      color: ColorManger.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 8.w),
                  TextButton(
                    onPressed: () {
                      context.pushNamed(Routes.login);
                    },
                    style: ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(Colors.transparent),
                      padding: WidgetStatePropertyAll(EdgeInsets.zero),
                      minimumSize: WidgetStatePropertyAll(Size.zero),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    ),
                    
                    child: Text(
                      "Login",
                      style: TextStyles.b4.copyWith(
                        color: ColorManger.black,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,

                        decorationThickness: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5.h),

          // Bottom Button
          BottomButton(
            text: "Sign Up",
            onPressed: () {
              if (context.read<SignUpCubit>().validateForm()) {
                context.read<SignUpCubit>().emitSignUpStates(
                  SignUpRequestModel(
                    firstName: context
                        .read<SignUpCubit>()
                        .firstNameController
                        .text
                        .trim(),
                    lastName: context
                        .read<SignUpCubit>()
                        .lastNameController
                        .text
                        .trim(),
                    email: context
                        .read<SignUpCubit>()
                        .emailController
                        .text
                        .trim(),
                    password: context
                        .read<SignUpCubit>()
                        .passwordController
                        .text,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
