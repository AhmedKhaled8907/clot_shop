import 'package:clot_shop/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        var cubit = BottomNavBarCubit.get(context);
        return Scaffold(
          body: cubit.views[cubit.currentIndex],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: BottomNavigationBar(
              selectedItemColor: AppColors.primary,
              iconSize: 30,
              backgroundColor: AppColors.background,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeCurrentIndex(index);
              },
              items: cubit.navBarItems,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              enableFeedback: false,
            ),
          ),
        );
      },
    );
  }
}
