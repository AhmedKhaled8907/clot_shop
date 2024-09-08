import 'package:clot_shop/presentation/home/bloc/top_selling_cubit/top_selling_cubit.dart';
import 'package:clot_shop/presentation/home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/texts/see_all_text.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopSellingCubit()..getTopSellingProducts(),
      child: BlocBuilder<TopSellingCubit, TopSellingState>(
        builder: (context, state) {
          if (state is TopSellingLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TopSellingLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SeeAllText(
                  title: 'Top Selling',
                  onTap: () {},
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.375,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 16);
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
