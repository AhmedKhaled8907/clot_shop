import 'package:clot_shop/common/helper/navigator/app_navigator.dart';
import 'package:clot_shop/core/configs/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../search/pages/search_page.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: () {
        AppNavigator.push(
          context,
          const SearchPage(),
        );
      },
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
