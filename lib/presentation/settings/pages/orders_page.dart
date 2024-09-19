import 'package:clot_shop/common/widgets/app_bar/basic_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_colors.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(
        title: Text(
          'Orders',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 12);
        },
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // AppNavigator.push(context, const UserInfoPage());
            },
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.secondBackground,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: const ListTile(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                leading: Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.receipt_long_rounded,
                    size: 28,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Order',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      '#86486',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  '4 items',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  size: 36,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
