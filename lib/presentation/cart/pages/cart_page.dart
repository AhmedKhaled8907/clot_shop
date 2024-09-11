import 'package:clot_shop/common/helper/bloc/button/button_state_cubit.dart';
import 'package:clot_shop/common/widgets/app_bar/basic_app_bar.dart';
import 'package:clot_shop/presentation/cart/bloc/cubit/cart_product_display_cubit.dart';
import 'package:clot_shop/presentation/cart/widgets/cart_list_view.dart';
import 'package:clot_shop/presentation/cart/widgets/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/cart_empty.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartProductDisplayCubit()..getCartProducts(),
        ),
        BlocProvider(
          create: (context) => ButtonStateCubit(),
        ),
      ],
      child: Scaffold(
        appBar: const BasicAppBar(
          title: Text(
            'Cart',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocBuilder<CartProductDisplayCubit, CartProductDisplayState>(
          builder: (context, state) {
            if (state is CartProductDisplayLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CartProductDisplayLoaded) {
              if (state.products.isEmpty) {
                return const CartEmpty();
              }

              return Column(
                children: [
                  Expanded(
                    child: CartListView(entities: state.products),
                  ),
                  Checkout(products: state.products),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
