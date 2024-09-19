import 'package:clot_shop/common/widgets/images/name_images.dart';
import 'package:clot_shop/domain/auth/entities/user_entity.dart';
import 'package:clot_shop/presentation/auth/bloc/display_user_info_cubit/display_user_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/app_colors.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayUserInfoCubit, DisplayUserInfoState>(
      builder: (context, state) {
        if (state is DisplayUserInfoLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is DisplayUserInfoSuccess) {
          return _success(state.entity);
        }

        if (state is DisplayUserInfoFailure) {
          return Text(state.errMessage);
        }
        return Container();
      },
    );
  }

  Column _success(UserEntity entity) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: entity.image!.isEmpty
              ? SizedBox(
                  height: 100,
                  width: 100,
                  child: NameImage(
                    user: entity,
                    fontSize: 36,
                  ),
                )
              : Image.network(
                  entity.image!,
                  fit: BoxFit.fill,
                  height: 100,
                  width: 100,
                ),
        ),
        const SizedBox(height: 24),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          decoration: const BoxDecoration(
            color: AppColors.secondBackground,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 4,
            ),
            title: Text(
              '${entity.firstName} ${entity.lastName}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  entity.email!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '+20-1024-029-330',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            trailing: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
              child: const Text(
                'Edit',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
