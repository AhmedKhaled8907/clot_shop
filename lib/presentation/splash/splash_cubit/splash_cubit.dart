import 'package:clot_shop/domain/auth/usecases/is_logged_in_usecase.dart';
import 'package:clot_shop/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    var isLoggedIn = await sl<IsLoggedInUsecase>().call();
    if (isLoggedIn) {
      return emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
