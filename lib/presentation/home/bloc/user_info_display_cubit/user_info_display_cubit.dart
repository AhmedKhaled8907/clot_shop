import 'dart:async';

import 'package:clot_shop/domain/auth/usecases/get_user_usecase.dart';
import 'package:clot_shop/core/services/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/auth/entities/user_entity.dart';

part 'user_info_display_state.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  UserInfoDisplayCubit() : super(UserInfoDisplayInitial());

  Future<void> displayUserInfo() async {
    var returnedData = await sl<GetUserUsecase>().call();
    returnedData.fold((error) {
      emit(
        UserInfoDisplayFailure(errMessage: error.toString()),
      );
    }, (data) {
      emit(
        UserInfoDisplaySuccess(user: data),
      );
    });
  }
}
