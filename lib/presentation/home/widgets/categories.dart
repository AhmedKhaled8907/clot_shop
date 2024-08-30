import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/bloc/category/cubit/category_display_cubit.dart';
import '../../../common/helper/images/image_display_helper.dart';
import '../../../domain/category/entities/category_entity.dart';

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
                _seaAll(),
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

  Widget _seaAll() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Categories',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        Text(
          'See All',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        )
      ],
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
