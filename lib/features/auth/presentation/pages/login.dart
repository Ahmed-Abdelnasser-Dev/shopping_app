import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/theme/colors.dart';
import 'package:shopping_app/core/theme/spacing.dart';
import 'package:shopping_app/core/theme/text_styles.dart';
import 'package:shopping_app/core/widgets/bottom_button.dart';
import 'package:shopping_app/core/widgets/main_app_bar.dart';
import 'package:shopping_app/features/auth/data/model/login_request_model.dart';
import 'package:shopping_app/features/auth/presentation/cubit/login_cubit.dart';
import 'package:shopping_app/features/auth/presentation/widgets/login_bloc_listener.dart';
import 'package:shopping_app/features/auth/presentation/widgets/terms_text.dart';
import 'package:shopping_app/features/auth/presentation/widgets/email_and_password_form.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(showBackButton: true, showCartButton: false),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.generalHorizontalPadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Welcome Text
                Center(
                  child: Column(
                    children: [
                      Text("Welcome", style: TextStyles.h2),
                      SizedBox(height: 8.h),
                      Text(
                        "Please enter your data to continue",
                        style: TextStyles.b3.copyWith(color: ColorManger.grey),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 50.h),

                EmailAndPasswordForm(),

                SizedBox(height: Spacing.generalSpacing),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                      foregroundColor: ColorManger.errorRed,
                      overlayColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {},
                    child: Text("Forgot password?", style: TextStyles.b3),
                  ),
                ),

                SizedBox(height: Spacing.generalSpacing),

                // Remember Me
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Remember me",
                      style: TextStyles.b3.copyWith(color: ColorManger.black),
                    ),
                    Switch(
                      value: false,
                      onChanged: (value) {},
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
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),

      // Bottom Section
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Terms Text
          Center(child: TermsText()),
          SizedBox(height: 20.h),
          // Bottom Button
          BottomButton(
            text: "Login",
            onPressed: () {
              if (context.read<LoginCubit>().formKey.currentState!.validate()) {
                context.read<LoginCubit>().emitLoginStates(
                  LoginRequestModel(
                    email: context.read<LoginCubit>().emailController.text,
                    password: context
                        .read<LoginCubit>()
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
