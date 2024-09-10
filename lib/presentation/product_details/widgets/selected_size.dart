import 'package:clot_shop/common/helper/bottom_sheet/app_bottom_sheet.dart';
import 'package:clot_shop/presentation/product_details/bloc/product_size_selection_cubit.dart';
import 'package:clot_shop/presentation/product_details/widgets/product_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/product/entities/product_model.dart';

class SelectedSize extends StatelessWidget {
  final ProductEntity entity;
  const SelectedSize({
    required this.entity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.display(
          context,
          BlocProvider.value(
            value: context.read<ProductSizeSelectionCubit>(),
            child: ProductSizes(entity: entity),
          ),
        );
      },
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Size',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            Row(
              children: [
                BlocBuilder<ProductSizeSelectionCubit, int>(
                  builder: (context, state) {
                    return Text(
                      entity.sizes[state].toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    );
                  },
                ),
                const SizedBox(width: 16),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
