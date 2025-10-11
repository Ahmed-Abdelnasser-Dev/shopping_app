import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/routes/routes.dart';
import 'package:shopping_app/core/theme/colors.dart';
import 'package:shopping_app/core/theme/text_styles.dart';
import 'package:shopping_app/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:shopping_app/features/auth/presentation/cubit/signup_state.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      child: const SizedBox.shrink(),
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
      listener: (context, state) {
        state.whenOrNull(
          success: (success) {
            // Dismiss any existing loading dialog
            Navigator.of(context, rootNavigator: true).pop();

            final email = context.read<SignUpCubit>().emailController.text;

            Navigator.pushReplacementNamed(
              context,
              Routes.otp,
              arguments: email,
            );
          },

          loading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: ColorManger.primary),
              ),
            );
          },

          failure: (error) {
            // Dismiss any existing loading dialog
            Navigator.of(context, rootNavigator: true).pop();
            _showErrorSnackBar(context, error);
          },
        );
      },
    );
  }

  /// Shows a simple error snackbar with the error message
  void _showErrorSnackBar(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: ColorManger.errorRed.withAlpha((0.9 * 255).round()),
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(milliseconds: 2500),
        content: Text(
          error,
          style: TextStyles.b3.copyWith(color: ColorManger.white),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
