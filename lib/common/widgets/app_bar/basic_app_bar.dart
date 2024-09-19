import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_colors.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final Color? backgroundColor;
  final bool hideBack;
  final double? height;
  final void Function()? onPressed;
  const BasicAppBar({
    this.title,
    this.hideBack = false,
    this.action,
    this.backgroundColor,
    this.height,
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      surfaceTintColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      toolbarHeight: height ?? 80,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: title ?? const Text(''),
      ),
      titleSpacing: 0,
      actions: [action ?? Container()],
      leading: hideBack
          ? null
          : GestureDetector(
              onTap: onPressed ??
                  () {
                    Navigator.pop(context);
                  },
              child: Container(
                margin: const EdgeInsets.only(left: 8.0),
                decoration: const BoxDecoration(
                  color: AppColors.secondBackground,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 80);
}
