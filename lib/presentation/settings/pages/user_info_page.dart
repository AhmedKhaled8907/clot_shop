import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_colors.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(
        // vertical: 8,
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
        title: const Text(
          'Ahmed Khaled',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(
              'sezarsezar123@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 4),
            Text(
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
    );
  }
}
