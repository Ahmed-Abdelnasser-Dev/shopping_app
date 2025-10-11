import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/dependency_injection/dependency_injection.dart';
import 'package:shopping_app/core/routes/routes.dart';
import 'package:shopping_app/features/auth/presentation/cubit/login_cubit.dart';
import 'package:shopping_app/features/auth/presentation/cubit/otp_cubit.dart';
import 'package:shopping_app/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:shopping_app/features/auth/presentation/pages/login_page.dart';
import 'package:shopping_app/features/auth/presentation/pages/otp_page.dart';
import 'package:shopping_app/features/auth/presentation/pages/signup_page.dart';
import 'package:shopping_app/features/home/presentation/pages/home.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const Home());

      case Routes.signUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUp(),
          ),
        );

      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const Login(),
          ),
        );

      case Routes.otp:
        final email = settings.arguments as String? ?? '';
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<OtpCubit>(param1: email),
            child: Otp(email: email),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
