import 'package:clot_shop/common/helper/navigator/app_navigator.dart';
import 'package:clot_shop/core/configs/assets/assets.dart';
import 'package:clot_shop/core/configs/theme/app_colors.dart';
import 'package:clot_shop/presentation/home/pages/home_page.dart';
import 'package:clot_shop/presentation/splash/splash_cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../auth/pages/signin.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          AppNavigator.pushReplacement(
            context,
            const SigninPage(),
          );
        }
        if (state is Authenticated) {
          AppNavigator.pushReplacement(
            context,
            const HomePage(),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: SvgPicture.asset(Assets.vectorsLogo),
        ),
      ),
    );
  }
}
