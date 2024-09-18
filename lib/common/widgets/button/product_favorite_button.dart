import 'package:clot_shop/common/helper/bloc/product/favorite_product_cubit/favorite_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/product/entities/product_entity.dart';

class ProductFavoriteButton extends StatelessWidget {
  final double? height;
  final ProductEntity entity;

  const ProductFavoriteButton({
    this.height = 35,
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      right: 5,
      child: InkWell(
        onTap: () {
          context.read<FavoriteProductCubit>().addOrRemoveFavoriteProduct(
                entity: entity,
              );
        },
        borderRadius: BorderRadius.circular(50),
        child: Container(
          height: height,
          width: height,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.secondBackground,
          ),
          child: BlocBuilder<FavoriteProductCubit, bool>(
            builder: (context, state) {
              return Icon(
                state ? Icons.favorite : Icons.favorite_border,
                color: state ? Colors.red : Colors.white,
              );
            },
          ),
        ),
      ),
    );
  }
}
