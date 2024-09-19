import 'package:clot_shop/common/helper/bloc/button/button_state_cubit.dart';
import 'package:clot_shop/common/helper/navigator/app_navigator.dart';
import 'package:clot_shop/common/widgets/button/basic_reactive_button.dart';
import 'package:clot_shop/core/configs/theme/app_colors.dart';
import 'package:clot_shop/data/order/models/add_to_cart_req.dart';
import 'package:clot_shop/domain/order/usecases/add_to_cart_usecase.dart';
import 'package:clot_shop/presentation/cart/pages/cart_page.dart';
import 'package:clot_shop/presentation/product_details/bloc/product_quantity_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/product/product_price_helper.dart';
import '../../../domain/product/entities/product_entity.dart';
import '../bloc/product_color_selection_cubit.dart';
import '../bloc/product_size_selection_cubit.dart';

class AddToCart extends StatelessWidget {
  final ProductEntity entity;
  const AddToCart({required this.entity, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ButtonStateCubit, ButtonState>(
      listener: (context, state) {
        if (state is ButtonSuccessState) {
          AppNavigator.push(context, const CartPage());
        }
        if (state is ButtonFailureState) {
          var snackbar = SnackBar(
            content: Text(state.errorMessage),
            behavior: SnackBarBehavior.floating,
          );
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      },
      builder: (context, state) {
        if (state is ButtonSuccessState) {
          Padding(
            padding: const EdgeInsets.all(24),
            child: BasicReactiveButton(
              backgroundColor: AppColors.secondBackground,
              height: 55,
              onPressed: () {},
              content: const Text(
                'Add to Bag',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(24),
          child: BasicReactiveButton(
            height: 55,
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
                  'Add to Cart',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
    var createAt = Timestamp.now();

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
