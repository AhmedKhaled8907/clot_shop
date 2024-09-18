import 'package:clot_shop/core/configs/theme/app_colors.dart';
import 'package:clot_shop/presentation/settings/pages/favorites_page.dart';
import 'package:clot_shop/presentation/settings/pages/orders_page.dart';
import 'package:clot_shop/presentation/settings/pages/user_info_page.dart';
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
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Column(
          children: [
            _userInfo(context),
            const SizedBox(height: 16),
            _favorites(context),
            const SizedBox(height: 16),
            _orders(context),
          ],
        ),
      ),
    );
  }

  Widget _userInfo(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, const UserInfoPage());
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: const ListTile(
          contentPadding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          title: Text(
            'User Info',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            size: 36,
          ),
        ),
      ),
    );
  }

  Widget _favorites(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, const FavoritesPage());
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: const ListTile(
          contentPadding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          title: Text(
            'Favorites',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            size: 36,
          ),
        ),
      ),
    );
  }

  Widget _orders(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, const OrdersPage());
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: const ListTile(
          contentPadding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          title: Text(
            'Orders',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            size: 36,
          ),
        ),
      ),
    );
  }
}
