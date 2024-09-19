import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_colors.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const SettingsCard({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: const BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 16,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          trailing: const Icon(
            Icons.chevron_right,
            size: 36,
          ),
        ),
      ),
    );
  }
}
