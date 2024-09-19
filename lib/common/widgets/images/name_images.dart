import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/auth/entities/user_entity.dart';

class NameImage extends StatelessWidget {
  final UserEntity user;
  final double height;
  final double fontSize;

  const NameImage({
    super.key,
    required this.user,
    this.height = 45,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      decoration: const BoxDecoration(
        color: AppColors.secondBackground,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          user.firstName!.substring(0, 1).toUpperCase() +
              user.lastName!.substring(0, 1).toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
