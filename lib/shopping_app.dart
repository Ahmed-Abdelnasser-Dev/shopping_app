import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/dependency_injection/dependency_injection.dart';
import 'package:shopping_app/core/routes/app_router.dart';
import 'package:shopping_app/core/theme/colors.dart';
import 'package:shopping_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shopping_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:shopping_app/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:shopping_app/features/auth/presentation/pages/signup_page.dart';
import 'package:shopping_app/features/home/presentation/pages/home.dart';

class ShoppingApp extends StatelessWidget {
  final AppRouter appRouter;

  const ShoppingApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>()..checkAuthStatus(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Shopping App',
            theme: ThemeData(
              scaffoldBackgroundColor: ColorManger.background,
              colorScheme: ColorScheme.fromSeed(seedColor: ColorManger.primary),
              useMaterial3: true,
            ),
            home: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  ),
                  loading: () => const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  ),
                  authenticated: () => const Home(),
                  unauthenticated: () => BlocProvider(
                    create: (context) => getIt<SignUpCubit>(),
                    child: const SignUp(),
                  ),
                  failure: (error) => Scaffold(
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Authentication Error: $error'),
                          ElevatedButton(
                            onPressed: () {
                              context.read<AuthCubit>().checkAuthStatus();
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            onGenerateRoute: appRouter.generateRoute,
          );
        },
      ),
    );
  }
}
