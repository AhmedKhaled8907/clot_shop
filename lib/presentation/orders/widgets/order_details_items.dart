import 'package:clot_shop/presentation/orders/pages/order_items_page.dart';
import 'package:flutter/material.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../../core/configs/assets/assets.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/order/entity/order_entity.dart';

class OrderDetailsItems extends StatelessWidget {
  const OrderDetailsItems({
    super.key,
    required this.entity,
  });

  final OrderEntity entity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Order Items',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.secondBackground,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            leading: Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Image.asset(
                Assets.imagesOrderWhite,
                fit: BoxFit.fill,
                height: 25,
              ),
            ),
            title: Text(
              '${entity.itemsCount} items',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: InkWell(
              onTap: () {
                AppNavigator.push(
                  context,
                  OrderItemsPage(entity: entity),
                );
              },
              borderRadius: BorderRadius.circular(8),
              child: const Text(
                'View All',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
