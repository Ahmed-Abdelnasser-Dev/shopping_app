import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/routes/route_helper_extensions.dart';
import 'package:shopping_app/core/routes/routes.dart';
import 'package:shopping_app/core/theme/colors.dart';
import 'package:shopping_app/core/theme/text_styles.dart';
import 'package:shopping_app/features/auth/presentation/cubit/otp_cubit.dart';
import 'package:shopping_app/features/auth/presentation/cubit/otp_state.dart';

class OtpBlocListener extends StatelessWidget {
  const OtpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpCubit, OtpState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          success: (otpResponse) {
            // Show success snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: ColorManger.successGreen,
                elevation: 4,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                duration: const Duration(seconds: 2),
                content: Text(
                  otpResponse.message,
                  style: TextStyles.b3.copyWith(color: ColorManger.white),
                ),
              ),
            );

            // Store context reference before async operation
            final navigatorContext = context;
            Future.delayed(const Duration(seconds: 2), () {
              if (navigatorContext.mounted) {
                navigatorContext.pushNamedAndRemoveUntil(Routes.login, Routes.root);
              }
            });
          },
          failure: (error) {
            // Show error snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: ColorManger.errorRed,
                elevation: 4,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                duration: const Duration(seconds: 4),
                content: Text(
                  _getErrorMessage(error),
                  style: TextStyles.b3.copyWith(color: ColorManger.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
          resendLoading: () {},
          resendSuccess: (otpResponse) {
            // Show resend success snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: ColorManger.successGreen,
                elevation: 4,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                duration: const Duration(seconds: 2),
                content: Text(
                  'OTP sent successfully to your email',
                  style: TextStyles.b3.copyWith(color: ColorManger.white),
                ),
              ),
            );
          },
          resendFailure: (error) {
            // Show resend error snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: ColorManger.errorRed,
                elevation: 4,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                duration: const Duration(seconds: 4),
                content: Text(
                  _getResendErrorMessage(error),
                  style: TextStyles.b3.copyWith(color: ColorManger.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
          timerUpdate: (remainingSeconds) {
            // Update the cubit's timer state
            context.read<OtpCubit>().updateTimer(remainingSeconds);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  String _getErrorMessage(String error) {
    // Handle different types of OTP verification errors
    if (error.toLowerCase().contains('invalid') || error.toLowerCase().contains('incorrect')) {
      return 'Invalid OTP code. Please check and try again.';
    } else if (error.toLowerCase().contains('expired')) {
      return 'OTP code has expired. Please request a new one.';
    } else if (error.toLowerCase().contains('network') || error.toLowerCase().contains('connection')) {
      return 'Network error. Please check your connection and try again.';
    } else if (error.toLowerCase().contains('timeout')) {
      return 'Request timed out. Please try again.';
    } else {
      return 'Verification failed. Please try again.';
    }
  }

  String _getResendErrorMessage(String error) {
    // Handle different types of resend OTP errors
    if (error.toLowerCase().contains('limit') || error.toLowerCase().contains('too many')) {
      return 'Too many requests. Please wait before requesting another OTP.';
    } else if (error.toLowerCase().contains('network') || error.toLowerCase().contains('connection')) {
      return 'Network error. Please check your connection and try again.';
    } else if (error.toLowerCase().contains('timeout')) {
      return 'Request timed out. Please try again.';
    } else {
      return 'Failed to resend OTP. Please try again.';
    }
  }
}
