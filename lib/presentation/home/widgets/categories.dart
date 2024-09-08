import 'package:clot_shop/common/helper/navigator/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/bloc/category/cubit/category_display_cubit.dart';
import '../../../common/helper/images/image_display_helper.dart';
import '../../../common/widgets/texts/see_all_text.dart';
import '../../../domain/category/entities/category_entity.dart';
import '../../all_categories/pages/all_categories.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryDisplayCubit()..getCategories(),
      child: BlocBuilder<CategoryDisplayCubit, CategoryDisplayState>(
        builder: (context, state) {
          if (state is CategoryDisplayLoading) {
            return const CircularProgressIndicator();
          }
          if (state is CategoryDisplaySuccess) {
            return Column(
              children: [
                SeeAllText(
                  title: 'Categories',
                  onTap: () {
                    AppNavigator.push(
                      context,
                      const AllCategoriesPage(),
                    );
                  },
                ),
                const SizedBox(height: 20),
                _categories(state.category)
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _categories(List<CategoryEntity> categories) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      ImageDisplayHelper.generateCategoryImageURL(
                        categories[index].image,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                categories[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              )
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemCount: categories.length,
      ),
    );
  }
}
