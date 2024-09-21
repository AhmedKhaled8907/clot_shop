import 'package:clot_shop/core/configs/assets/assets.dart';
import 'package:clot_shop/presentation/home/bloc/user_info_display_cubit/user_info_display_cubit.dart';
import 'package:clot_shop/presentation/settings/pages/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/helper/navigator/app_navigator.dart';
import '../../../common/widgets/images/name_images.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/auth/entities/user_entity.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
        ),
      ],
      child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
        builder: (context, state) {
          if (state is UserInfoDisplayLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserInfoDisplaySuccess) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _profileImage(state.user, context),
                _gender(state.user),
                _favorites(context),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _profileImage(UserEntity user, BuildContext context) {
    return Center(
      child: user.image!.isEmpty
          ? NameImage(user: user)
          : Image.network(
              user.image!,
              fit: BoxFit.fill,
              height: 45,
              width: 45,
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

  Widget _favorites(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, const FavoritesPage());
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          Assets.imagesFavorite,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
