import 'package:clot_shop/common/widgets/button/basic_reactive_button.dart';
import 'package:clot_shop/common/widgets/button/logo_signin_button.dart';
import 'package:clot_shop/data/models/user_info_model.dart';
import 'package:clot_shop/domain/auth/usecases/signin_usecase.dart';
import 'package:clot_shop/presentation/auth/pages/forgot_password.dart';
import 'package:clot_shop/presentation/auth/pages/signup.dart';
import 'package:clot_shop/presentation/home/pages/home_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/bloc/button/button_state.dart';
import '../../../common/helper/bloc/button/button_state_cubit.dart';
import '../../../common/helper/functions/my_validators.dart';
import '../../../common/helper/navigator/app_navigator.dart';
import '../../../core/configs/assets/assets.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;

  bool isObscure = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonStateCubit(),
      child: Scaffold(
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
                child: BlocListener<ButtonStateCubit, ButtonState>(
                  listener: (context, state) {
                    if (state is ButtonFailureState) {
                      var snackBar = SnackBar(
                        content: Text(state.errorMessage),
                        behavior: SnackBarBehavior.floating,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    if (state is ButtonSuccessState) {
                      AppNavigator.push(
                        context,
                        const HomePage(),
                      );
                    }
                  },
                  child: Form(
                    key: _formKey,
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
                ),
              ),
            ],
          ),
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
    return TextFormField(
      controller: emailController,
      focusNode: emailFocusNode,
      decoration: const InputDecoration(
        hintText: 'Email Address',
      ),
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
        _signinUser(context);
      },
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
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          _signinUser(context);
        },
        title: 'Sign in',
      );
    });
  }

  void _signinUser(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      FocusScope.of(context).unfocus();
      context.read<ButtonStateCubit>().execute(
            usecase: SigninUsecase(),
            params: UserInfoModel(
              email: emailController.text,
              password: passwordController.text,
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
