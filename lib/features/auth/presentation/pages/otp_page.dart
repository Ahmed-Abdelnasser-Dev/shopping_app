import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/dependency_injection/dependency_injection.dart';
import 'package:shopping_app/core/theme/colors.dart';
import 'package:shopping_app/core/theme/spacing.dart';
import 'package:shopping_app/core/theme/text_styles.dart';
import 'package:shopping_app/core/widgets/bottom_button.dart';
import 'package:shopping_app/core/widgets/main_app_bar.dart';
import 'package:shopping_app/features/auth/presentation/cubit/otp_cubit.dart';
import 'package:shopping_app/features/auth/presentation/cubit/otp_state.dart';
import 'package:shopping_app/features/auth/presentation/widgets/bloc_listeners/otp_bloc_listener.dart';
import 'package:shopping_app/features/auth/presentation/widgets/otp_input_field.dart';

class Otp extends StatelessWidget {
  final String email;

  const Otp({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OtpCubit>(param1: email),
      child: const _OtpView(),
    );
  }
}

class _OtpView extends StatelessWidget {
  const _OtpView();

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
                SizedBox(height: 50.h),

                // Title
                Center(
                  child: Column(
                    children: [
                      Text(
                        "OTP Verification",
                        style: TextStyles.h2.copyWith(color: ColorManger.black),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "We have sent a verification code to",
                        style: TextStyles.b3.copyWith(color: ColorManger.grey),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        context.read<OtpCubit>().email,
                        style: TextStyles.b3.copyWith(
                          color: ColorManger.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 50.h),

                // OTP Input Fields
                BlocBuilder<OtpCubit, OtpState>(
                  builder: (context, state) {
                    final cubit = context.read<OtpCubit>();
                    return Form(
                      key: cubit.formKey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(6, (index) {
                          return OtpInputField(
                            controller: cubit.otpControllers[index],
                            focusNode: cubit.otpFocusNodes[index],
                            isFirst: index == 0,
                            isLast: index == 5,
                            onChanged: (value) {
                              cubit.onOtpChanged(index, value);
                            },
                          );
                        }),
                      ),
                    );
                  },
                ),

                SizedBox(height: 30.h),

                // Timer and Resend
                BlocBuilder<OtpCubit, OtpState>(
                  builder: (context, state) {
                    final cubit = context.read<OtpCubit>();
                    return Column(
                      children: [
                        if (!cubit.canResend)
                          Text(
                            "Resend code in ${cubit.formattedTime}",
                            style: TextStyles.b3.copyWith(
                              color: ColorManger.grey,
                            ),
                          )
                        else
                          Text(
                            "Didn't receive the code?",
                            style: TextStyles.b3.copyWith(
                              color: ColorManger.grey,
                            ),
                          ),
                        SizedBox(height: 8.h),
                        if (cubit.canResend)
                          state.when(
                            initial: () => TextButton(
                              onPressed: () {
                                cubit.emitResendOtpStates();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                visualDensity: VisualDensity.compact,
                              ),
                              child: Text(
                                "Resend Code",
                                style: TextStyles.b3.copyWith(
                                  color: ColorManger.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            loading: () => TextButton(
                              onPressed: () {
                                cubit.emitResendOtpStates();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                visualDensity: VisualDensity.compact,
                              ),
                              child: Text(
                                "Resend Code",
                                style: TextStyles.b3.copyWith(
                                  color: ColorManger.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            success: (_) => TextButton(
                              onPressed: () {
                                cubit.emitResendOtpStates();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                visualDensity: VisualDensity.compact,
                              ),
                              child: Text(
                                "Resend Code",
                                style: TextStyles.b3.copyWith(
                                  color: ColorManger.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            failure: (_) => TextButton(
                              onPressed: () {
                                cubit.emitResendOtpStates();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                visualDensity: VisualDensity.compact,
                              ),
                              child: Text(
                                "Resend Code",
                                style: TextStyles.b3.copyWith(
                                  color: ColorManger.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            resendLoading: () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 16.w,
                                  height: 16.h,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(ColorManger.primary),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "Sending...",
                                  style: TextStyles.b3.copyWith(
                                    color: ColorManger.grey,
                                  ),
                                ),
                              ],
                            ),
                            resendSuccess: (_) => TextButton(
                              onPressed: () {
                                cubit.emitResendOtpStates();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                visualDensity: VisualDensity.compact,
                              ),
                              child: Text(
                                "Resend Code",
                                style: TextStyles.b3.copyWith(
                                  color: ColorManger.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            resendFailure: (_) => TextButton(
                              onPressed: () {
                                cubit.emitResendOtpStates();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                visualDensity: VisualDensity.compact,
                              ),
                              child: Text(
                                "Resend Code",
                                style: TextStyles.b3.copyWith(
                                  color: ColorManger.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            timerUpdate: (_) => TextButton(
                              onPressed: () {
                                cubit.emitResendOtpStates();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                visualDensity: VisualDensity.compact,
                              ),
                              child: Text(
                                "Resend Code",
                                style: TextStyles.b3.copyWith(
                                  color: ColorManger.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),

                SizedBox(height: 50.h),

                const OtpBlocListener(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.h),
          // Bottom Button
          BlocBuilder<OtpCubit, OtpState>(
            builder: (context, state) {
              final cubit = context.read<OtpCubit>();
              return BottomButton(
                text: "Confirm Code",
                onPressed: () {
                  cubit.emitVerifyEmailStates();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
