import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/order/entity/order_entity.dart';

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({
    super.key,
    required this.entity,
    required this.index,
  });

  final OrderEntity entity;
  final int index;

  @override
  Widget build(BuildContext context) {
    bool? done = entity.orderStatus[index].done!;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        alignment: Alignment.center,
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: done ? AppColors.primary : Colors.white,
          shape: BoxShape.circle,
        ),
        child: done
            ? const Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              )
            : null,
      ),
      title: Text(
        '${entity.orderStatus[index].title}',
        style: TextStyle(
          fontSize: 16,
          color: done ? Colors.white : Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        entity.orderStatus[index].createdAt!.toDate().toString().split(' ')[0],
        style: TextStyle(
          color: done ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
