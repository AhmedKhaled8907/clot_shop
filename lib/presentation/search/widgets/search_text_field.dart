import 'package:clot_shop/common/helper/bloc/product/cubit/product_cubit.dart';
import 'package:clot_shop/core/configs/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (value) {
        if (value.isEmpty) {
          context.read<ProductCubit>().getInitial();
        }
        context.read<ProductCubit>().getProducts(params: value);
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
