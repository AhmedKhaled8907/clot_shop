import 'package:clot_shop/domain/auth/usecases/get_ages_usecase.dart';
import 'package:clot_shop/core/services/service_locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ages_display_state.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayState> {
  AgesDisplayCubit() : super(AgesDisplayLoading());

  void displayAges() async {
    var returnedData = await sl<GetAgesUsecase>().call();

    returnedData.fold(
      (failure) => emit(
        AgesDisplayFailure(errMessage: failure.errMessage),
      ),
      (ages) => emit(
        AgesDisplayLoaded(ages: ages),
      ),
    );
  }
}
