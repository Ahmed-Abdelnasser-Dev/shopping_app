import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/routes/app_router.dart';
import 'package:shopping_app/core/routes/routes.dart';
import 'package:shopping_app/core/theme/colors.dart';
import 'package:shopping_app/core/theme/text_styles.dart';

class ShoppingApp extends StatelessWidget {
  final AppRouter appRouter;

  const ShoppingApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: ColorManger.white,
            textTheme: TextTheme(
              bodyLarge: TextStyles.h1,
            ),
          ),
          initialRoute: Routes.root,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
