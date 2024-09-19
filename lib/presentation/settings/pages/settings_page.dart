import 'package:clot_shop/core/configs/assets/assets.dart';
import 'package:clot_shop/presentation/settings/pages/favorites_page.dart';
import 'package:clot_shop/presentation/settings/pages/orders_page.dart';
import 'package:clot_shop/presentation/settings/pages/user_info_page.dart';
import 'package:clot_shop/presentation/settings/widgets/settings_card.dart';
import 'package:flutter/material.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../../common/widgets/app_bar/basic_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Center(
                child: Image.asset(
                  Assets.imagesSettingsProfile,
                  fit: BoxFit.fill,
                  height: 100,
                  width: 100,
                ),
              ),
              const SizedBox(height: 16),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TextButton(
          onPressed: () {},
          child: const Text(
            'Sign Out',
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
