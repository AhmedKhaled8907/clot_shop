import 'package:clot_shop/common/helper/bloc/category/cubit/category_display_cubit.dart';
import 'package:clot_shop/common/helper/images/image_display_helper.dart';
import 'package:clot_shop/common/helper/navigator/app_navigator.dart';
import 'package:clot_shop/common/widgets/app_bar/basic_app_bar.dart';
import 'package:clot_shop/core/configs/theme/app_colors.dart';
import 'package:clot_shop/presentation/category_products/pages/category_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryDisplayCubit()..getCategories(),
      child: Scaffold(
        appBar: const BasicAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Shop by Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                BlocBuilder<CategoryDisplayCubit, CategoryDisplayState>(
                  builder: (context, state) {
                    if (state is CategoryDisplayLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is CategoryDisplaySuccess) {
                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: state.category.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 12);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              AppNavigator.push(
                                context,
                                CategoryProducts(
                                  entity: state.category[index],
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColors.secondBackground,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                leading: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        ImageDisplayHelper
                                            .generateCategoryImageURL(
                                          state.category[index].image,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                title: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    state.category[index].title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
