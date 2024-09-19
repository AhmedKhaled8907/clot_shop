import 'package:clot_shop/common/widgets/app_bar/basic_app_bar.dart';
import 'package:clot_shop/domain/order/entity/order_entity.dart';
import 'package:clot_shop/presentation/orders/bloc/cubit/orders_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/empty_pages/empty_page.dart';
import '../../../core/configs/assets/assets.dart';
import '../../../core/configs/theme/app_colors.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersDisplayCubit()..displayOrders(),
      child: const Scaffold(
        appBar: BasicAppBar(
          title: Text(
            'Orders',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: OrdersListView(),
      ),
    );
  }
}

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
                  // AppNavigator.push(context, const UserInfoPage());
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

class OrderCard extends StatelessWidget {
  final OrderEntity entity;

  const OrderCard({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        leading: const Padding(
          padding: EdgeInsets.only(right: 4),
          child: Icon(
            Icons.receipt_long_rounded,
            size: 28,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Order',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              '#${entity.code}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        subtitle: Text(
          '${entity.itemsCount} items',
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          size: 36,
        ),
      ),
    );
  }
}
