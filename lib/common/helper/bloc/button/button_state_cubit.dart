import 'package:clot_shop/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'button_state.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  Future<void> execute({
    dynamic params,
    required Usecase usecase,
  }) async {
    emit(ButtonLoadingState());
    try {
      Either returnedData = await usecase.call(param: params);
      returnedData.fold((error) {
        emit(
          ButtonFailureState(errorMessage: error),
        );
      }, (data) {
        emit(
          ButtonSuccessState(),
        );
      });
    } catch (e) {
      emit(
        ButtonFailureState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
