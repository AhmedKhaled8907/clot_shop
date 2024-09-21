import 'package:clot_shop/domain/order/entity/order_status_entity.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/order/entity/order_entity.dart';

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({
    super.key,
    required this.entity,
    required this.index,
    required this.statusEntity,
  });

  final OrderStatusEntity statusEntity;
  final OrderEntity entity;
  final int index;

  @override
  Widget build(BuildContext context) {
    ;
    
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        alignment: Alignment.center,
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: statusEntity.done! ? AppColors.primary : Colors.white,
          shape: BoxShape.circle,
        ),
        child: statusEntity.done!
            ? const Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              )
            : null,
      ),
      title: Text(
        '${statusEntity.title}',
        style: TextStyle(
          fontSize: 16,
          color: statusEntity.done! ? Colors.white : Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        statusEntity.createdAt!.split(' ')[0],
        style: TextStyle(
          color: statusEntity.done! ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
