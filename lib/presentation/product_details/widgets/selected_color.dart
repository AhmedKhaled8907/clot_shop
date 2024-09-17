import 'package:clot_shop/presentation/product_details/widgets/product_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/bottom_sheet/app_bottom_sheet.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/product/entities/product_entity.dart';
import '../bloc/product_color_selection_cubit.dart';

class SelectedColors extends StatelessWidget {
  final ProductEntity entity;
  const SelectedColors({required this.entity, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.display(
          context,
          BlocProvider.value(
            value: context.read<ProductColorSelectionCubit>(),
            child: ProductColors(entity: entity),
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
              'Color',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            Row(
              children: [
                BlocBuilder<ProductColorSelectionCubit, int>(
                  builder: (context, state) {
                    return Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(
                          entity.colors[state].rgb[0],
                          entity.colors[state].rgb[1],
                          entity.colors[state].rgb[2],
                          1,
                        ),
                        shape: BoxShape.circle,
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
