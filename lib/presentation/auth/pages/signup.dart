import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../common/widgets/button/logo_signin_button.dart';
import '../../../core/configs/assets/assets.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
        child: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                _signupText(context),
                const SizedBox(height: 20),
                _firstNameField(context),
                const SizedBox(height: 20),
                _lastNameField(context),
                const SizedBox(height: 20),
                _emailField(context),
                const SizedBox(height: 20),
                _passwordField(context),
                const SizedBox(height: 36),
                _signupButton(context),
                const SizedBox(height: 24),
                _orDivider(),
                const SizedBox(height: 24),
                _continueWithButtons(context),
                const Expanded(
                  child: SizedBox(),
                ),
                _createAccount(context)
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _signupText(BuildContext context) {
    return const Text(
      'Sign up',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _firstNameField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: 'First Name'),
      keyboardType: TextInputType.text,
    );
  }

  Widget _lastNameField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: 'Last Name'),
      keyboardType: TextInputType.text,
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
      keyboardType: TextInputType.visiblePassword,
    );
  }

  Widget _signupButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(
          context,
          const SignupPage(),
        );
      },
      title: 'Sign up',
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
            const TextSpan(text: "Have an account Already? "),
            TextSpan(
              text: 'Sign in',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pop(context);
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
