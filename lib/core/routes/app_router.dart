import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/dependency_injection/dependency_injection.dart';
import 'package:shopping_app/core/routes/routes.dart';
import 'package:shopping_app/features/auth/presentation/cubit/login_cubit.dart';
import 'package:shopping_app/features/auth/presentation/pages/login.dart';
import 'package:shopping_app/features/auth/presentation/pages/sign_up.dart';
import 'package:shopping_app/features/home/presentation/pages/home.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const Home());

      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUp());

      case Routes.login:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const Login(),
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
