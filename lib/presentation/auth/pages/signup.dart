import 'package:clot_shop/common/helper/functions/my_validators.dart';
import 'package:clot_shop/data/auth/models/user_creation_req.dart';
import 'package:clot_shop/presentation/auth/pages/about_yourself.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../common/widgets/button/logo_signin_button.dart';
import '../../../core/configs/assets/assets.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode firstNameFocusNode;
  late FocusNode lastNameFocusNode;

  bool isObscure = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    firstNameFocusNode = FocusNode();
    lastNameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 48,
          bottom: 24,
          left: 24,
          right: 24,
        ),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 36),
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
                      child: SizedBox(height: 16),
                    ),
                    _createAccount(context)
                  ],
                ),
              ),
            ),
          ],
        ),
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
    return TextFormField(
      controller: firstNameController,
      focusNode: firstNameFocusNode,
      decoration: const InputDecoration(hintText: 'First Name'),
      keyboardType: TextInputType.text,
      validator: (value) {
        return MyValidators.displayNameValidator(value);
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(lastNameFocusNode);
      },
    );
  }

  Widget _lastNameField(BuildContext context) {
    return TextFormField(
      controller: lastNameController,
      focusNode: lastNameFocusNode,
      decoration: const InputDecoration(hintText: 'Last Name'),
      keyboardType: TextInputType.text,
      validator: (value) {
        return MyValidators.displayNameValidator(value);
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(emailFocusNode);
      },
    );
  }

  Widget _emailField(BuildContext context) {
    return TextFormField(
      controller: emailController,
      focusNode: emailFocusNode,
      decoration: const InputDecoration(hintText: 'Email Address'),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        return MyValidators.emailValidator(value);
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(passwordFocusNode);
      },
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      focusNode: passwordFocusNode,
      decoration: InputDecoration(
        hintText: 'Password',
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
          icon: isObscure
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
        ),
      ),
      obscureText: isObscure,
      validator: (value) {
        return MyValidators.passwordValidator(value);
      },
      onFieldSubmitted: (value) {
        _signupUser(context);
      },
    );
  }

  Widget _signupButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        _signupUser(context);
      },
      title: 'Continue',
    );
  }

  void _signupUser(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      FocusScope.of(context).unfocus();

      AppNavigator.push(
        context,
        AboutYourselfPage(
          user: UserCreationReq(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            email: emailController.text,
            password: passwordController.text,
          ),
        ),
      );
    }
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
