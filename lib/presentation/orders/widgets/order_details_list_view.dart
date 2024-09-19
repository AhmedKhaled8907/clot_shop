import 'package:flutter/material.dart';

import '../../../domain/order/entity/order_entity.dart';
import 'order_details_card.dart';

class OrderDetailsListView extends StatelessWidget {
  const OrderDetailsListView({
    super.key,
    required this.entity,
  });

  final OrderEntity entity;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: entity.orderStatus.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 8);
      },
      itemBuilder: (BuildContext context, int index) {
        return OrderDetailsCard(
          entity: entity,
          index: index,
        );
      },
    );
  }
}
