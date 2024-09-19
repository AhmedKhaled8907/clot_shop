import 'package:clot_shop/presentation/root/pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../../common/widgets/button/basic_app_button.dart';

class EmptyPage extends StatelessWidget {
  final String title;
  final String image;

  const EmptyPage({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            BasicAppButton(
              width: 0,
              content: const Text(
                'Continue Shopping',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                AppNavigator.pushReplacement(
                  context,
                  const RootPage(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}