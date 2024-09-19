import 'package:flutter/material.dart';

import '../../../core/configs/assets/assets.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/order/entity/order_entity.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity entity;

  const OrderCard({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          padding: const EdgeInsets.only(right: 8),
          child: Image.asset(
            Assets.imagesOrderWhite,
            fit: BoxFit.fill,
            height: 30,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Order',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              '#${entity.code}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        subtitle: Text(
          '${entity.itemsCount} items',
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          size: 36,
        ),
      ),
    );
  }
}
