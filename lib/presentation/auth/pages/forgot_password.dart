import 'package:clot_shop/common/helper/bloc/button/button_state_cubit.dart';
import 'package:clot_shop/common/widgets/app_bar/basic_app_bar.dart';
import 'package:clot_shop/common/widgets/button/basic_reactive_button.dart';
import 'package:clot_shop/core/configs/theme/app_colors.dart';
import 'package:clot_shop/domain/auth/usecases/password_reset_usecase.dart';
import 'package:clot_shop/presentation/auth/pages/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/helper/functions/my_validators.dart';
import '../../../common/helper/navigator/app_navigator.dart';
import '../../../core/configs/assets/assets.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonStateCubit(),
      child: Scaffold(
        appBar: const BasicAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(
            bottom: 24,
            left: 24,
            right: 24,
          ),
          child: SingleChildScrollView(
            child: BlocListener<ButtonStateCubit, ButtonState>(
              listener: (context, state) {
                if (state is ButtonFailureState) {
                  var snackBar = SnackBar(
                    content: Center(
                      child: Text(
                        state.errorMessage,
                      ),
                    ),
                    backgroundColor: AppColors.secondBackground,
                    shape: const StadiumBorder(),
                    behavior: SnackBarBehavior.floating,
                  );
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                if (state is ButtonSuccessState) {
                  AppNavigator.pushReplacement(
                    context,
                    const ResetPasswordPage(),
                  );
                }
              },
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        Assets.vectorsForgotPassword,
                        fit: BoxFit.cover,
                        height: 400,
                        width: 400,
                      ),
                    ),
                    _forgotPasswordText(context),
                    const SizedBox(height: 20),
                    _emailField(context),
                    const SizedBox(height: 24),
                    _continueButton(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _forgotPasswordText(BuildContext context) {
    return const Text(
      'Forgot Password',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
        hintText: 'Email Address',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        return MyValidators.emailValidator(value);
      },
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            FocusScope.of(context).unfocus();
            context.read<ButtonStateCubit>().execute(
                  usecase: PasswordResetUsecase(),
                  params: emailController.text,
                );
          }
        },
        title: 'Continue',
      );
    });
  }
}
