import 'package:clot_shop/core/app_bloc_observer.dart';
import 'package:clot_shop/core/configs/theme/app_theme.dart';
import 'package:clot_shop/firebase_options.dart';
import 'package:clot_shop/presentation/splash/pages/splash.dart';
import 'package:clot_shop/presentation/splash/splash_cubit/splash_cubit.dart';
import 'package:clot_shop/core/services/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/root/bloc/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  serviceLocator();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashCubit()..appStarted(),
        ),
        BlocProvider(
          create: (_) => sl<BottomNavBarCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clog Shop',
        theme: AppTheme.appTheme,
        home: const SplashPage(),
      ),
    );
  }
}
