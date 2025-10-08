import 'package:flutter/material.dart';
import 'package:shopping_app/core/routes/routes.dart';
import 'package:shopping_app/features/home/presentation/pages/home.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const Home());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
