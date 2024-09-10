import 'package:clot_shop/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../common/helper/images/image_display_helper.dart';
import '../../../domain/order/entity/product_ordered_entity.dart';

class CartCard extends StatelessWidget {
  final ProductOrderedEntity entity;
  const CartCard({
    required this.entity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          ImageDisplayHelper.generateProductImageURL(
                            entity.productImage,
                          ),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entity.productTitle,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Text.rich(
                            overflow: TextOverflow.ellipsis,
                            TextSpan(
                              text: 'Size - ',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(
                                  text: entity.productSize,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Text.rich(
                            overflow: TextOverflow.ellipsis,
                            TextSpan(
                              text: 'Color - ',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(
                                  text: entity.productColor,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${entity.totalPrice}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // context
                    //     .read<CartProductsDisplayCubit>()
                    //     .removeProduct(productOrderedEntity);
                  },
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.remove,
                      size: 16,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
