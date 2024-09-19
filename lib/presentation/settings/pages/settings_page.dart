import 'package:clot_shop/presentation/auth/bloc/display_user_info_cubit/display_user_info_cubit.dart';
import 'package:clot_shop/presentation/auth/bloc/sign_out_cubit/sign_out_cubit.dart';
import 'package:clot_shop/presentation/auth/pages/signin.dart';
import 'package:clot_shop/presentation/settings/pages/favorites_page.dart';
import 'package:clot_shop/presentation/orders/pages/orders_page.dart';
import 'package:clot_shop/presentation/settings/pages/user_info_page.dart';
import 'package:clot_shop/presentation/settings/widgets/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../../common/widgets/app_bar/basic_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignOutCubit(),
        ),
        BlocProvider(
          create: (context) => DisplayUserInfoCubit()..displayUserInfo(),
        ),
      ],
      child: Scaffold(
        appBar: const BasicAppBar(
          title: Text(
            'Settings',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const UserInfoPage(),
                const SizedBox(height: 16),
                SettingsCard(
                  title: 'Address',
                  onTap: () {},
                ),
                const SizedBox(height: 8),
                SettingsCard(
                  title: 'Favorites',
                  onTap: () {
                    AppNavigator.push(context, const FavoritesPage());
                  },
                ),
                const SizedBox(height: 8),
                SettingsCard(
                  title: 'Orders',
                  onTap: () {
                    AppNavigator.push(context, const OrdersPage());
                  },
                ),
                const SizedBox(height: 8),
                SettingsCard(
                  title: 'Payment',
                  onTap: () {},
                ),
                const SizedBox(height: 8),
                SettingsCard(
                  title: 'Help',
                  onTap: () {},
                ),
                const SizedBox(height: 8),
                SettingsCard(
                  title: 'Support',
                  onTap: () {},
                ),
                const SizedBox(height: 16),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const SignOutButton(),
      ),
    );
  }
}

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignOutCubit, SignOutState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          AppNavigator.pushReplacement(
            context,
            const SigninPage(),
          );
        }
      },
      child: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextButton(
            onPressed: () {
              context.read<SignOutCubit>().signOut();
            },
            child: const Text(
              'Sign Out',
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }),
    );
  }
}
