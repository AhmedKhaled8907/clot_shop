import 'package:clot_shop/core/configs/assets/assets.dart';
import 'package:clot_shop/presentation/home/bloc/user_info_display_cubit/user_info_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/auth/entities/user_entity.dart';
import '../../cart/pages/cart_page.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
        builder: (context, state) {
          if (state is UserInfoDisplayLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserInfoDisplaySuccess) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _profileImage(state.user),
                _gender(state.user),
                _cart(context),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _profileImage(UserEntity user) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: user.image!.isEmpty
              ? const AssetImage(Assets.imagesProfile)
              : NetworkImage(user.image!),
        ),
        color: AppColors.secondBackground,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _gender(UserEntity user) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          user.gender == 1 ? 'Men' : 'Women',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _cart(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, const CartPage());
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          Assets.vectorsBag,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
