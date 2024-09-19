import 'package:clot_shop/presentation/home/widgets/categories.dart';
import 'package:clot_shop/presentation/home/widgets/header.dart';
import 'package:clot_shop/presentation/home/widgets/top_selling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/bloc/category/cubit/category_display_cubit.dart';
import '../widgets/new_in.dart';
import '../widgets/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryDisplayCubit()..getCategories(),
        )
      ],
      child: const Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  Header(),
                  SizedBox(height: 24),
                  SearchField(),
                  SizedBox(height: 24),
                  Categories(),
                  SizedBox(height: 24),
                  TopSelling(),
                  SizedBox(height: 24),
                  NewIn(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
