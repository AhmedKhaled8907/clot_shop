import 'package:clot_shop/presentation/orders/pages/order_details_page.dart';
import 'package:clot_shop/presentation/orders/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../../common/widgets/empty_pages/empty_page.dart';
import '../../../core/configs/assets/assets.dart';
import '../bloc/cubit/orders_display_cubit.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersDisplayCubit, OrdersDisplayState>(
      builder: (context, state) {
        if (state is OrdersDisplayLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is OrdersDisplayLoaded) {
          if (state.orders.isEmpty) {
            return const EmptyPage(
              hideButton: false,
              image: Assets.imagesCheckOut,
              title: 'No orders yet',
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: state.orders.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 12);
            },
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  AppNavigator.push(
                    context,
                    OrderDetailsPage(
                      entity: state.orders[index],
                    ),
                  );
                },
                child: OrderCard(entity: state.orders[index]),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
