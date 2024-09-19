import 'package:clot_shop/core/configs/theme/app_colors.dart';
import 'package:clot_shop/domain/auth/entities/user_entity.dart';
import 'package:clot_shop/presentation/auth/bloc/image_picker_cubit/image_picker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'pick_image.dart';

class RegisterImage extends StatelessWidget {
  const RegisterImage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<ImagePickerCubit, UserEntity?>(
      builder: (context, state) {
        return Center(
          child: SizedBox(
            height: size.width * 0.3,
            width: size.width * 0.3,
            child: PickImage(
              pickedImage:
                  state?.image != null ? XFile(state!.image!) : null,
              onTap: () async {
                onImageTap(context);
              },
            ),
          ),
        );
      },
    );
  }
}

Future<void> onImageTap(BuildContext context) async {
  await showImagePickerDialog(
    context: context,
    onPressedCamera: () async {
      context.read<ImagePickerCubit>().pickImageFromCamera();
    },
    onPressedGallery: () async {
      context.read<ImagePickerCubit>().pickImageFromGallery();
    },
    onPressedRemove: () async {
      context.read<ImagePickerCubit>().removeImage();
    },
  );
}

Future<void> showImagePickerDialog({
  required BuildContext context,
  required Function onPressedCamera,
  required Function onPressedGallery,
  required Function onPressedRemove,
}) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: AppColors.secondBackground,
      elevation: 0,
      title: const Center(
        child: Text(
          'Choose an option',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageOptionButton(
              title: 'Camera',
              onPressed: () {
                onPressedCamera();
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
            ImageOptionButton(
              title: 'Gallery',
              onPressed: () {
                onPressedGallery();
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
            ImageOptionButton(
              title: 'Remove',
              onPressed: () {
                onPressedRemove();
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    ),
  );
}

class ImageOptionButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;

  const ImageOptionButton({
    super.key,
    this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: const Padding(
        padding: EdgeInsets.only(right: 16),
        child: Icon(
          Icons.camera_alt_rounded,
          color: AppColors.primary,
        ),
      ),
      label: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
