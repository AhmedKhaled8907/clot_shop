import 'package:clot_shop/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppBottomSheet {
  static Future<void> display(
    BuildContext context,
    Widget widget,
  ) {
    return showModalBottomSheet(
      backgroundColor: AppColors.background,
      elevation: 0,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      ),
      builder: (_) {
        return widget;
      },
    );
  }
}
