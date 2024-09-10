import 'package:clot_shop/common/helper/bloc/button/button_state_cubit.dart';
import 'package:clot_shop/common/widgets/button/basic_reactive_button.dart';
import 'package:clot_shop/data/order/models/add_to_cart_req.dart';
import 'package:clot_shop/domain/order/usecases/add_to_cart_usecase.dart';
import 'package:clot_shop/presentation/product_details/bloc/product_quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/product/product_price_helper.dart';
import '../../../domain/product/entities/product_model.dart';
import '../bloc/product_color_selection_cubit.dart';
import '../bloc/product_size_selection_cubit.dart';

class AddToBag extends StatelessWidget {
  final ProductEntity entity;
  const AddToBag({required this.entity, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: BasicReactiveButton(
        onPressed: () {
          _addToCartData(context);
        },
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<ProductQuantityCubit, int>(
              builder: (context, state) {
                var price =
                    ProductPriceHelper.provideCurrentPrice(entity) * state;

                return Text(
                  '\$$price',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const Text(
              'Add to Bag',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addToCartData(BuildContext context) {
    var productQuantity = context.read<ProductQuantityCubit>().state;
    var productSize =
        entity.sizes[context.read<ProductSizeSelectionCubit>().state];
    var productColor = entity
        .colors[context.read<ProductColorSelectionCubit>().selectedIndex].title;
    var productPrice = ProductPriceHelper.provideCurrentPrice(entity);
    var totalPrice = productQuantity * productPrice;
    var createAt = DateTime.now().toString();

    context.read<ButtonStateCubit>().execute(
          usecase: AddToCartUsecase(),
          params: AddToCartReq(
            productId: entity.productId,
            
            productTitle: entity.title,
            productImage: entity.images[0],
            productQuantity: productQuantity,
            productSize: productSize,
            productColor: productColor,
            productPrice: productPrice,
            totalPrice: totalPrice,
            createAt: createAt,
          ),
        );
  }
}
