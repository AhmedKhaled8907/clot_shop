import 'package:clot_shop/core/configs/theme/app_colors.dart';
import 'package:clot_shop/presentation/product_details/bloc/product_color_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/product/entities/product_entity.dart';

class ProductColors extends StatelessWidget {
  final ProductEntity entity;

  const ProductColors({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                const Center(
                  child: Text(
                    'Colors',
                    style: TextStyle(
                      fontSize: 22,
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
            ),
            const SizedBox(height: 24),
            ListView.separated(
              shrinkWrap: true,
              itemCount: entity.colors.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16);
              },
              itemBuilder: (BuildContext context, int index) {
                return BlocBuilder<ProductColorSelectionCubit, int>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        context
                            .read<ProductColorSelectionCubit>()
                            .itemSelection(index);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: state == index
                              ? AppColors.primary
                              : AppColors.secondBackground,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              entity.colors[index].title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(
                                      entity.colors[index].rgb[0],
                                      entity.colors[index].rgb[1],
                                      entity.colors[index].rgb[2],
                                      1,
                                    ),
                                    shape: BoxShape.circle,
                                    border: state == index
                                        ? Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          )
                                        : null,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                if (state == index)
                                  const Icon(
                                    Icons.check,
                                    size: 30,
                                  )
                                else
                                  Container(width: 30),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
