import 'package:clot_shop/presentation/auth/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/configs/assets/assets.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 24,
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(height: 100),
            Center(
              child: SvgPicture.asset(
                Assets.vectorsEmailSending,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 36),
            _resetPasswordText(context),
            const SizedBox(height: 36),
            _returnButton(context),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }

  Widget _resetPasswordText(BuildContext context) {
    return const Text(
      'We sent you an Email to reset your password.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _returnButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.pushReplacement(
          context,
          const SigninPage(),
        );
      },
      title: 'Return to Login',
    );
  }
}
