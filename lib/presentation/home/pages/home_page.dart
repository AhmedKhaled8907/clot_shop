import 'package:clot_shop/presentation/home/widgets/categories.dart';
import 'package:clot_shop/presentation/home/widgets/header.dart';
import 'package:flutter/material.dart';

import '../widgets/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              children: [
                Header(),
                SizedBox(height: 24),
                SearchField(),
                SizedBox(height: 24),
                Categories(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
