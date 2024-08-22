import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_colors.dart';

class LogoSigninButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String logo;
  final String title;
  final double? height;
  final double? width;
  const LogoSigninButton({
    required this.onPressed,
    required this.logo,
    required this.title,
    this.height,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondBackground,
        minimumSize: Size(
          width ?? MediaQuery.of(context).size.width,
          height ?? 50,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(logo),
          const SizedBox(width: 16),
          Text(
            'Continue with $title',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 0),
        ],
      ),
    );
  }
}
