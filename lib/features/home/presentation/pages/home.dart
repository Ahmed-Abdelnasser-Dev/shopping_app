import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/theme/text_styles.dart';
import 'package:shopping_app/core/theme/colors.dart';
import 'package:shopping_app/core/widgets/main_app_bar.dart';
import 'package:shopping_app/features/auth/presentation/cubit/auth_cubit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        showCartButton: true,
        isHome: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Shopping App!',
              style: TextStyles.h1.copyWith(color: ColorManger.primary),
            ),
            const SizedBox(height: 20),
            Text(
              'You are successfully logged in',
              style: TextStyles.b2.copyWith(color: ColorManger.grey),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                context.read<AuthCubit>().logout();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManger.errorRed,
                foregroundColor: ColorManger.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

