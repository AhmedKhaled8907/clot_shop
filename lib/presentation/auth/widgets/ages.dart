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
      height: MediaQuery.of(context).size.height / 2.7,
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
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              ageData['value'] ?? 'Unknown',
              // textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey.shade300,
        thickness: 0.15,
      ),
      itemCount: ages.length,
    );
  }
}
