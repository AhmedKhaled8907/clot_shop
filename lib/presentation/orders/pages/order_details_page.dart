import 'package:clot_shop/common/widgets/app_bar/basic_app_bar.dart';
import 'package:clot_shop/domain/order/entity/order_entity.dart';
import 'package:flutter/material.dart';

import '../widgets/order_details_items.dart';
import '../widgets/order_details_list_view.dart';
import '../widgets/order_details_shipping.dart';

class OrderDetailsPage extends StatelessWidget {
  final OrderEntity entity;

  const OrderDetailsPage({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text(
          'Order #${entity.code}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              OrderDetailsListView(entity: entity),
              const SizedBox(height: 36),
              OrderDetailsItems(entity: entity),
              const SizedBox(height: 36),
              OrderDetailsShipping(entity: entity),
            ],
          ),
        ),
      ),
    );
  }
}
