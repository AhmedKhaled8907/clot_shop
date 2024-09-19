import 'package:clot_shop/domain/order/entity/order_entity.dart';
import 'package:clot_shop/presentation/orders/widgets/order_items_card.dart';
import 'package:flutter/widgets.dart';

class OrderItemsListView extends StatelessWidget {
  const OrderItemsListView({super.key, required this.entity});

  final OrderEntity entity;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: entity.products.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 12);
      },
      itemBuilder: (BuildContext context, int index) {
        return OrderItemsCard(
          entity: entity,
          index: index,
        );
      },
    );
  }
}
