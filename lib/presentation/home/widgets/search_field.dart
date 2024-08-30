import 'package:clot_shop/core/configs/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        prefixIcon: SvgPicture.asset(
          Assets.vectorsSearch,
          fit: BoxFit.none,
        ),
        hintText: 'Search',
      ),
    );
  }
}
