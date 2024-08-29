import 'package:clot_shop/common/widgets/button/logo_signin_button.dart';
import 'package:clot_shop/presentation/auth/pages/forgot_password.dart';
import 'package:clot_shop/presentation/auth/pages/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/configs/assets/assets.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 64,
          bottom: 24,
          left: 24,
          right: 24,
        ),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 36),
                  _signinText(context),
                  const SizedBox(height: 20),
                  _emailField(context),
                  const SizedBox(height: 20),
                  _passwordField(context),
                  const SizedBox(height: 20),
                  _forgotPassword(context),
                  const SizedBox(height: 36),
                  _signinButton(context),
                  const SizedBox(height: 36),
                  _orDivider(),
                  const SizedBox(height: 36),
                  _continueWithButtons(context),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  _createAccount(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return const Text(
      'Sign in',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _emailField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: 'Email Address'),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _passwordField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: 'Password'),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(
          context,
          const ForgotPasswordPage(),
        );
      },
      child: const Text(
        'Forgot password?',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _signinButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(
          context,
          const SignupPage(),
        );
      },
      title: 'Sign in',
    );
  }

  Row _orDivider() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: Colors.white30,
            thickness: 1,
          ),
        ),
        SizedBox(width: 10),
        Text(
          'or',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Divider(
            color: Colors.white30,
            thickness: 1,
          ),
        ),
      ],
    );
  }

  Widget _continueWithButtons(BuildContext context) {
    return Column(
      children: [
        LogoSigninButton(
          logo: Assets.imagesApple,
          title: 'Apple',
          onPressed: () {
            AppNavigator.push(
              context,
              const SignupPage(),
            );
          },
        ),
        const SizedBox(height: 20),
        LogoSigninButton(
          logo: Assets.imagesGoogle,
          title: 'Google',
          onPressed: () {
            AppNavigator.push(
              context,
              const SignupPage(),
            );
          },
        ),
        const SizedBox(height: 20),
        LogoSigninButton(
          logo: Assets.imagesFacebook,
          title: 'Facebook',
          onPressed: () {
            AppNavigator.push(
              context,
              const SignupPage(),
            );
          },
        ),
      ],
    );
  }

  Widget _createAccount(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(text: "Don't you have an account? "),
            TextSpan(
              text: 'Sign up',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  AppNavigator.push(
                    context,
                    const SignupPage(),
                  );
                },
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
