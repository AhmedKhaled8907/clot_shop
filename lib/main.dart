import 'package:clot_shop/core/configs/theme/app_theme.dart';
import 'package:clot_shop/presentation/splash/pages/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clog Shop',
      theme: AppTheme.appTheme,
      home: const SplashPage(),
    );
  }
}
