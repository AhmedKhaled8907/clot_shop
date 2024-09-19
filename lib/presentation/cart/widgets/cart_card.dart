import 'package:clot_shop/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/helper/images/image_display_helper.dart';
import '../../../domain/order/entity/product_ordered_entity.dart';
import '../bloc/cart_product_display_cubit/cart_product_display_cubit.dart';

class CartCard extends StatelessWidget {
  final ProductOrderedEntity entity;
  final int index;

  const CartCard({
    required this.entity,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(entity.productId.toString()),
      direction: DismissDirection.horizontal,
      background: _buildDismissibleBackground(),
      onDismissed: (direction) {
        context.read<CartProductDisplayCubit>().deleteProductById(entity);
      },
      child: Container(
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
      ),
    );
  }

  Widget _buildDismissibleBackground() {
    return Row(
      children: [
        // Left side background when swiping to the right
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.redAccent,
            child: const Icon(
              Icons.clear,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
        // Right side background when swiping to the left
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.redAccent,
            child: const Icon(
              Icons.clear,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
      ],
    );
  }

  Text _totalPrice() {
    return Text(
      '\$${entity.totalPrice.toString()}',
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColors.primary,
        fontSize: 22,
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
            text: entity.productQuantity.toString(),
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
            text: entity.productColor,
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
            text: entity.productSize,
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
      entity.productTitle,
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
              entity.productImage,
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}


// GestureDetector(
//                   onTap: () {
//                     context
//                         .read<CartProductDisplayCubit>()
//                         .deleteProductById(entity);
//                   },
//                   child: Container(
//                     height: 24,
//                     width: 24,
//                     decoration: const BoxDecoration(
//                       color: Colors.redAccent,
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Icon(
//                       Icons.remove,
//                       size: 16,
//                     ),
//                   ),
//                 )