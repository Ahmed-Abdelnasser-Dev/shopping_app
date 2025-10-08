import 'package:flutter/material.dart';
import 'package:shopping_app/core/theme/text_styles.dart';
import 'package:shopping_app/core/theme/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hello World!',
          style: TextStyles.h1.copyWith(color: ColorManger.primary),
        ),
      ),
    );
  }
}
