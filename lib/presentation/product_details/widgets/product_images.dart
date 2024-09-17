import 'package:clot_shop/common/helper/images/image_display_helper.dart';
import 'package:flutter/material.dart';

import '../../../domain/product/entities/product_entity.dart';

class ProductImages extends StatelessWidget {
  final ProductEntity entity;
  const ProductImages({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.3,
      child: Center(
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: entity.images.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 8);
          },
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  image: NetworkImage(
                    ImageDisplayHelper.generateProductImageURL(
                      entity.images[index],
                    ),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
