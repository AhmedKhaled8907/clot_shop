import 'package:clot_shop/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/product/entities/product_model.dart';
import '../bloc/product_size_selection_cubit.dart';

class ProductSizes extends StatelessWidget {
  final ProductEntity entity;

  const ProductSizes({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _titleAndIcon(context),
            const SizedBox(height: 24),
            _listView(),
          ],
        ),
      ),
    );
  }

  Stack _titleAndIcon(BuildContext context) {
    return Stack(
      children: [
        const Center(
          child: Text(
            'Sizes',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
        )
      ],
    );
  }

  ListView _listView() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: entity.sizes.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 16);
      },
      itemBuilder: (BuildContext context, int index) {
        return BlocBuilder<ProductSizeSelectionCubit, int>(
          builder: (context, state) {
            return _sizeItem(context, index, state);
          },
        );
      },
    );
  }

  GestureDetector _sizeItem(BuildContext context, int index, int state) {
    return GestureDetector(
      onTap: () {
        context.read<ProductSizeSelectionCubit>().itemSelection(index);
        Navigator.pop(context);
      },
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color:
              state == index ? AppColors.primary : AppColors.secondBackground,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                entity.sizes[index].toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (state == index)
                const Icon(
                  Icons.check,
                  size: 30,
                )
              else
                Container(width: 30),
            ],
          ),
        ),
      ),
    );
  }
}
