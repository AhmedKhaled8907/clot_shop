import 'package:clot_shop/presentation/product_details/pages/product_details_page.dart';
import 'package:flutter/material.dart';

import '../../helper/images/image_display_helper.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/product/entities/product_model.dart';
import '../../helper/navigator/app_navigator.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductCard({
    required this.productEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(
          context,
          ProductDetailsPage(
            entity: productEntity,
          ),
        );
      },
      child: Container(
        width: 185,
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      ImageDisplayHelper.generateProductImageURL(
                        productEntity.images[0],
                      ),
                    ),
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productEntity.title,
                      style: const TextStyle(
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          productEntity.discountedPrice == 0
                              ? "${productEntity.price}\$"
                              : "${productEntity.discountedPrice}\$",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          productEntity.discountedPrice == 0
                              ? ''
                              : "${productEntity.price}\$",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.lineThrough,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
