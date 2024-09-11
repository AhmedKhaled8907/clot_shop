import 'package:clot_shop/domain/order/entity/product_ordered_entity.dart';
import 'package:clot_shop/presentation/cart/widgets/cart_card.dart';
import 'package:flutter/widgets.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key, required this.entities});

  final List<ProductOrderedEntity> entities;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              'Remove All (${entities.length})  ',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: entities.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 12);
            },
            itemBuilder: (BuildContext context, int index) {
              return CartCard(entity: entities[index]);
            },
          ),
        ),
      ],
    );
  }
}
