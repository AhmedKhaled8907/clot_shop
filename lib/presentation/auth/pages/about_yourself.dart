import 'package:clot_shop/common/helper/bloc/button/button_state_cubit.dart';
import 'package:clot_shop/common/widgets/app_bar/basic_app_bar.dart';
import 'package:clot_shop/common/widgets/button/basic_reactive_button.dart';
import 'package:clot_shop/data/models/user_creation_req.dart';
import 'package:clot_shop/domain/auth/usecases/signup_usecase.dart';
import 'package:clot_shop/presentation/auth/widgets/ages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/bottom_sheet/app_bottom_sheet.dart';
import '../../../common/helper/navigator/app_navigator.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../home/pages/home_page.dart';
import '../bloc/age_selection_cubit/age_selection_cubit.dart';
import '../bloc/ages_display_cubit/ages_display_cubit.dart';
import '../bloc/gender_selection_cubit/gender_selection_cubit.dart';

class AboutYourselfPage extends StatelessWidget {
  final UserCreationReq user;

  const AboutYourselfPage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GenderSelectionCubit()),
        BlocProvider(create: (context) => AgeSelectionCubit()),
        BlocProvider(create: (context) => AgesDisplayCubit()),
        BlocProvider(create: (context) => ButtonStateCubit()),
      ],
      child: Scaffold(
        appBar: const BasicAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 24,
          ).copyWith(bottom: 48),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: BlocListener<ButtonStateCubit, ButtonState>(
                  listener: (context, state) {
                    if (state is ButtonFailureState) {
                      var snackBar = SnackBar(
                        content: Center(child: Text(state.errorMessage)),
                        behavior: SnackBarBehavior.fixed,
                        padding: const EdgeInsets.all(16),
                        shape: const StadiumBorder(),
                      );
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    if (state is ButtonSuccessState) {
                      AppNavigator.push(
                        context,
                        const HomePage(),
                      );
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _aboutYourselfText(),
                      const SizedBox(height: 36),
                      _genderText(),
                      const SizedBox(height: 24),
                      _genders(),
                      const SizedBox(height: 36),
                      _ageText(),
                      const SizedBox(height: 24),
                      _ageButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _bottomContent(context),
      ),
    );
  }

  Widget _aboutYourselfText() {
    return const Text(
      'Tell us About yourself',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _genderText() {
    return const Text(
      'Who do you shop for?',
      style: TextStyle(
        fontSize: 18,
      ),
    );
  }

  Widget _genders() {
    return BlocBuilder<GenderSelectionCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            genderTile(context, 1, 'Men'),
            const SizedBox(width: 20),
            genderTile(context, 2, 'Women'),
          ],
        );
      },
    );
  }

  Expanded genderTile(BuildContext context, int genderIndex, String gender) {
    final cubit = context.read<GenderSelectionCubit>();

    return Expanded(
      child: GestureDetector(
        onTap: () {
          cubit.selectGender(genderIndex);
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: cubit.selectedIndex == genderIndex
                ? AppColors.primary
                : AppColors.secondBackground,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              gender,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _ageText() {
    return const Text(
      'How old are you?',
      style: TextStyle(
        fontSize: 18,
      ),
    );
  }

  Widget _ageButton() {
    return BlocBuilder<AgeSelectionCubit, String>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            AppBottomSheet.display(
              context,
              MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: context.read<AgeSelectionCubit>(),
                  ),
                  BlocProvider.value(
                    value: context.read<AgesDisplayCubit>()..displayAges(),
                  ),
                ],
                child: const Ages(),
              ),
            );
          },
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.secondBackground,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  state,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _bottomContent(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        child: _finishButton(context),
      ),
    );
  }

  Widget _finishButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          title: 'Finish',
          onPressed: () {
            user.gender = context.read<GenderSelectionCubit>().selectedIndex;
            user.age = context.read<AgeSelectionCubit>().selectedAge;
            context.read<ButtonStateCubit>().execute(
                  usecase: SignupUsecase(),
                  params: user,
                );
          },
        );
      },
    );
  }
}
