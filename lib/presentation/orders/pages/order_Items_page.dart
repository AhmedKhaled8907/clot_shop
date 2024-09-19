import 'package:clot_shop/common/widgets/app_bar/basic_app_bar.dart';
import 'package:clot_shop/presentation/orders/widgets/order_items_list_view.dart';
import 'package:flutter/material.dart';

import '../../../domain/order/entity/order_entity.dart';

class OrderItemsPage extends StatelessWidget {
  const OrderItemsPage({
    super.key,
    required this.entity,
  });

  final OrderEntity entity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text(
          'Order Items (${entity.itemsCount})',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: OrderItemsListView(entity: entity),
    );
  }
}
