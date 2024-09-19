import 'package:clot_shop/domain/auth/entities/user_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../domain/auth/usecases/get_user_usecase.dart';

part 'display_user_info_state.dart';

class DisplayUserInfoCubit extends Cubit<DisplayUserInfoState> {
  DisplayUserInfoCubit() : super(DisplayUserInfoInitial());

  Future<void> displayUserInfo() async {
    emit(DisplayUserInfoLoading());
    var returnedData = await sl<GetUserUsecase>().call();
    returnedData.fold(
      (error) => emit(
        DisplayUserInfoFailure(errMessage: error),
      ),
      (data) => emit(
        DisplayUserInfoSuccess(entity: data),
      ),
    );
  }
}
