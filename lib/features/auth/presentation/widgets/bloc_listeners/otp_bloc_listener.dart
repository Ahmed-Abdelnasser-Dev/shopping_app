import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/routes/route_helper_extensions.dart';
import 'package:shopping_app/core/routes/routes.dart';
import 'package:shopping_app/core/theme/colors.dart';
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
                content: Text(
                  otpResponse.message,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: ColorManger.successGreen,
                duration: const Duration(seconds: 1),
              ),
            );

            Future.delayed(const Duration(seconds: 1), () {
              context.pushNamedAndRemoveUntil(Routes.login, Routes.root);
            });
          },
          failure: (error) {
            // Show error snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  error,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: ColorManger.errorRed,
                duration: const Duration(seconds: 3),
              ),
            );
          },
          resendLoading: () {},
          resendSuccess: (otpResponse) {
            // Show resend success snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'OTP sent successfully',
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: ColorManger.successGreen,
                duration: const Duration(seconds: 2),
              ),
            );
          },
          resendFailure: (error) {
            // Show resend error snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  error,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: ColorManger.errorRed,
                duration: const Duration(seconds: 3),
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
