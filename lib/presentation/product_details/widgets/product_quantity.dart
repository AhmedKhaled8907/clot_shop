import 'package:clot_shop/presentation/product_details/bloc/product_quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/product/entities/product_model.dart';

class ProductQuantity extends StatelessWidget {
  final ProductEntity entity;

  const ProductQuantity({
    required this.entity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Quantity',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  context.read<ProductQuantityCubit>().decrement();
                },
                icon: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.remove,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              BlocBuilder<ProductQuantityCubit, int>(
                builder: (context, state) {
                  return FittedBox(
                    child: Text(
                      state.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 16),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  context.read<ProductQuantityCubit>().increment();
                },
                icon: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
