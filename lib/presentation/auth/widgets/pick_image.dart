import 'dart:io';

import 'package:clot_shop/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatelessWidget {
  const PickImage({
    super.key,
    this.onTap,
    this.pickedImage,
  });

  final void Function()? onTap;
  final XFile? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: pickedImage == null
                ? Container(
                    width: 100,
                    height: 100,
                    color: AppColors.secondBackground,
                    child: const Icon(
                      Icons.photo,
                      color: AppColors.background,
                    ),
                  )
                : Image.file(
                    File(pickedImage!.path),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Material(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.primary,
            child: InkWell(
              splashColor: Colors.grey,
              borderRadius: BorderRadius.circular(16),
              onTap: onTap,
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
