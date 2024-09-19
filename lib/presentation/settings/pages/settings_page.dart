import 'package:clot_shop/presentation/auth/bloc/display_user_info_cubit/display_user_info_cubit.dart';
import 'package:clot_shop/presentation/auth/bloc/sign_out_cubit/sign_out_cubit.dart';
import 'package:clot_shop/presentation/settings/pages/favorites_page.dart';
import 'package:clot_shop/presentation/orders/pages/orders_page.dart';
import 'package:clot_shop/presentation/settings/pages/user_info_page.dart';
import 'package:clot_shop/presentation/settings/widgets/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../../common/widgets/app_bar/basic_app_bar.dart';
import '../widgets/sign_out_button.dart';

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
          hideBack: true,
          title: Text(
            'Settings',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
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
                    const SizedBox(height: 24),
                    const SignOutButton(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
