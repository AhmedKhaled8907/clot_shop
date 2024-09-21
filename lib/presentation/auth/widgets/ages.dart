import 'package:clot_shop/core/configs/theme/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/age_selection_cubit/age_selection_cubit.dart';
import '../bloc/ages_display_cubit/ages_display_cubit.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
        builder: (context, state) {
          if (state is AgesDisplayLoading) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }

          if (state is AgesDisplayLoaded) {
            return _ages(state.ages);
          }

          if (state is AgesDisplayFailure) {
            return Container(
              alignment: Alignment.center,
              child: Text(state.errMessage),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      itemBuilder: (context, index) {
        final ageData = ages[index].data();
        return InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            Navigator.pop(context);
            context.read<AgeSelectionCubit>().selectAge(
                  ageData['value'],
                );
          },
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.secondBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                ageData['value'] ?? 'Unknown',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 0),
      itemCount: ages.length,
    );
  }
}
