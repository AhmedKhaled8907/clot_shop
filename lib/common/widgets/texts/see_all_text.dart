import 'package:flutter/material.dart';

class SeeAllText extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const SeeAllText({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.all(2),
            child: Text(
              'See All',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
        )
      ],
    );
  }
}
