import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../domain/auth/repos/auth_repo.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit() : super(SignOutInitial());

  Future<void> signOut() async {
    var result = await sl<AuthRepo>().signOut();

    result.fold(
      (failure) => emit(
        SignOutFailure(errMessage: failure),
      ),
      (data) => emit(
        SignOutSuccess(),
      ),
    );
  }
}
