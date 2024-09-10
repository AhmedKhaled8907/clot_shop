import 'package:clot_shop/common/helper/navigator/app_navigator.dart';
import 'package:clot_shop/common/widgets/product/product_card.dart';
import 'package:clot_shop/domain/product/usecases/get_new_in_usecase.dart';
import 'package:clot_shop/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/bloc/product/cubit/product_cubit.dart';
import '../../../common/widgets/texts/see_all_text.dart';
import 'all_new_in.dart';

class NewIn extends StatelessWidget {
  const NewIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
        usecase: sl<GetNewInUsecase>(),
      )..getProducts(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SeeAllText(
                  title: 'New In',
                  onTap: () {
                    AppNavigator.push(
                      context,
                      AllNewIn(
                        entity: state.products,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.39,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 8);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(
                        productEntity: state.products[index],
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
