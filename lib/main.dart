import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app/core/dependency_injection/dependency_injection.dart';
import 'package:shopping_app/core/routes/app_router.dart';
import 'package:shopping_app/shopping_app.dart';

// Configuration constants for the font
const String _customFontFamily = 'Inter';
const String _customFontPath = 'assets/fonts/poppins/Inter-Regular.ttf';

Future<void> _preloadCustomFont() async {
  try {
    final ByteData fontData = await rootBundle.load(_customFontPath);
    final fontLoader = FontLoader(_customFontFamily);

    fontLoader.addFont(Future.value(fontData.buffer.asByteData()));

    await fontLoader.load();
  } catch (e) {
    if (kDebugMode) {
      print('Error preloading custom font $_customFontFamily: $e');
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _preloadCustomFont();

  setupDependencyInjection();
  runApp(ShoppingApp(appRouter: AppRouter()));
}
