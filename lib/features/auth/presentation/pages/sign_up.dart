import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/routes/routes.dart';
import 'package:shopping_app/core/theme/colors.dart';
import 'package:shopping_app/core/theme/spacing.dart';
import 'package:shopping_app/core/theme/text_styles.dart';
import 'package:shopping_app/core/widgets/bottom_button.dart';
import 'package:shopping_app/core/widgets/main_app_bar.dart';
import 'package:shopping_app/core/widgets/labeled_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
 

  // Remember me toggle
  bool rememberMe = false;

  @override
  void dispose() {
 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(showBackButton: true, showCartButton: false),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Spacing.generalHorizontalPadding,
        ),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Center(
                child: Text(
                  "Sign Up",
                  style: TextStyles.h2.copyWith(color: ColorManger.black),
                ),
              ),

              SizedBox(height: 152.h),

              // Username Field
              LabeledTextField(
                label: "Username",
                validator: (value) {},
              ),

              SizedBox(height: Spacing.generalSpacing),

              // Password Field
              LabeledTextField(
                label: "Password",
                obscureText: true,
                validator: (value) {},
              ),

              SizedBox(height: Spacing.generalSpacing),

              // Email Field
              LabeledTextField(
                label: "Email Address",
                keyboardType: TextInputType.emailAddress,
                validator: (value) {},
              ),

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
                    onChanged: (value) {},
                    trackOutlineWidth: WidgetStatePropertyAll(0.0),
                    inactiveThumbColor: ColorManger.grey,
                    inactiveTrackColor: ColorManger.grey.withAlpha((0.4 * 255).round()),
                    activeThumbColor: ColorManger.successGreen,
                    activeTrackColor: ColorManger.successGreen.withAlpha((0.4 * 255).round()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomButton(
        text: "Sign Up",
        onPressed: () => Navigator.pushNamed(context, Routes.login),
      ),
    );
  }
}
