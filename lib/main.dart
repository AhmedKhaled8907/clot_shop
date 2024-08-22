import 'package:clot_shop/core/configs/theme/app_theme.dart';
import 'package:clot_shop/presentation/splash/pages/splash.dart';
import 'package:clot_shop/presentation/splash/splash_cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clog Shop',
        theme: AppTheme.appTheme,
        home: const SplashPage(),
      ),
    );
  }
}
