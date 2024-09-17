import 'package:clot_shop/common/helper/navigator/app_navigator.dart';
import 'package:clot_shop/common/widgets/button/basic_app_button.dart';
import 'package:clot_shop/domain/order/entity/product_ordered_entity.dart';
import 'package:clot_shop/presentation/cart/pages/checkout_page.dart';
import 'package:flutter/material.dart';

import '../../../common/helper/cart/cart_helper.dart';

class PriceCost extends StatelessWidget {
  final List<ProductOrderedEntity> products;

  const PriceCost({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    String subtotalPrice = CartHelper.calculateSubTotal(products).toString();

    return SizedBox(
      height: height / 3.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _subtotal(subtotalPrice),
            _shippingCost(),
            _tax(),
            _total(subtotalPrice),
            _placeOrder(products, context),
          ],
        ),
      ),
    );
  }

  Widget _subtotal(String subtotalPrice) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Subtotal',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        Text(
          '\$$subtotalPrice',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _shippingCost() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Shipping Cost',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        Text(
          '\$${8}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _tax() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Tax',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        Text(
          '\$${0}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _total(String subtotalPrice) {
    var total = (double.parse(subtotalPrice) + 8).toString();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Total',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        Text(
          '\$$total',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _placeOrder(
      List<ProductOrderedEntity> products, BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(
          context,
          Checkout(products: products),
        );
      },
      content: const Text(
        'Checkout',
        style: TextStyle(
          fontSize: 22,
          color: Colors.white,
        ),
      ),
    );
  }
}
