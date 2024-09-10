import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/configs/assets/assets.dart';
import '../../home/pages/home_page.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({
    super.key,
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
              Assets.vectorsCartBag,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 24),
            const Text(
              'Your Cart is Empty',
              style: TextStyle(
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
                  const HomePage(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
