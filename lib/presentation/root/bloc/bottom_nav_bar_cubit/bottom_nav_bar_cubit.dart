import 'package:clot_shop/presentation/home/pages/home_page.dart';
import 'package:clot_shop/presentation/orders/pages/orders_page.dart';
import 'package:clot_shop/presentation/settings/pages/favorites_page.dart';
import 'package:clot_shop/presentation/settings/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/configs/assets/assets.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(const BottomNavBarInitial(HomePage()));

  static BottomNavBarCubit get(BuildContext context) =>
      BlocProvider.of(context);

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  List<Widget> views = [
    const HomePage(),
    const OrdersPage(),
    const FavoritesPage(),
    const SettingsPage(),
  ];

  List<BottomNavigationBarItem> get navBarItems => [
        BottomNavigationBarItem(
          icon: Image.asset(
            Assets.imagesHome,
            fit: BoxFit.fill,
            height: 24,
          ),
          activeIcon: Image.asset(
            Assets.imagesHomeSelected,
            fit: BoxFit.fill,
            height: 24,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            Assets.imagesOrder,
            fit: BoxFit.fill,
            height: 24,
          ),
          activeIcon: Image.asset(
            Assets.imagesOrderSelected,
            fit: BoxFit.fill,
            height: 24,
          ),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            Assets.imagesHome,
            fit: BoxFit.fill,
            height: 24,
          ),
          activeIcon: Image.asset(
            Assets.imagesHomeSelected,
            fit: BoxFit.fill,
            height: 24,
          ),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            Assets.imagesUser,
            fit: BoxFit.fill,
            height: 24,
          ),
          activeIcon: Image.asset(
            Assets.imagesUserSelected,
            fit: BoxFit.fill,
            height: 24,
          ),
          label: 'Settings',
        ),
      ];

  void changeCurrentIndex(int index) {
    _currentIndex = index;
    emit(ChangeCurrentIndexState(views[_currentIndex]));
  }
}
