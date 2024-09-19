import 'package:clot_shop/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../common/helper/images/image_display_helper.dart';
import '../../../domain/order/entity/order_entity.dart';

class OrderItemsCard extends StatelessWidget {
  final OrderEntity entity;
  final int index;

  const OrderItemsCard({
    required this.entity,
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: _image(),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _title(),
                      _size(),
                      _color(),
                      _quantity(),
                      _totalPrice(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text _totalPrice() {
    return Text(
      '\$${entity.products[index].totalPrice.toString()}',
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColors.primary,
        fontSize: 24,
      ),
    );
  }

  Text _quantity() {
    return Text.rich(
      overflow: TextOverflow.ellipsis,
      TextSpan(
        text: 'Quantity -  ',
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        children: [
          TextSpan(
            text: entity.products[index].productQuantity.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Text _color() {
    return Text.rich(
      overflow: TextOverflow.ellipsis,
      TextSpan(
        text: 'Color - ',
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        children: [
          TextSpan(
            text: entity.products[index].productColor,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Text _size() {
    return Text.rich(
      overflow: TextOverflow.ellipsis,
      TextSpan(
        text: 'Size - ',
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        children: [
          TextSpan(
            text: entity.products[index].productSize,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Text _title() {
    return Text(
      entity.products[index].productTitle,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
    );
  }

  Container _image() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            ImageDisplayHelper.generateProductImageURL(
              entity.products[index].productImage,
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
