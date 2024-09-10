import 'package:clot_shop/common/widgets/button/basic_app_button.dart';
import 'package:clot_shop/presentation/product_details/bloc/product_quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/product/product_price_helper.dart';
import '../../../domain/product/entities/product_model.dart';

class AddToBag extends StatelessWidget {
  final ProductEntity entity;
  const AddToBag({required this.entity, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: BasicAppButton(
        onPressed: () {},
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
}
