import 'package:clot_shop/data/repo/auth_repo_impl.dart';
import 'package:clot_shop/data/source/auth_firebase_source.dart';
import 'package:clot_shop/domain/auth/repos/auth_repo.dart';
import 'package:clot_shop/domain/auth/usecases/get_ages_usecase.dart';
import 'package:clot_shop/domain/auth/usecases/get_user_usecase.dart';
import 'package:clot_shop/domain/auth/usecases/is_logged_in_usecase.dart';
import 'package:clot_shop/domain/auth/usecases/signin_usecase.dart';
import 'package:clot_shop/domain/auth/usecases/signup_usecase.dart';
import 'package:get_it/get_it.dart';

import 'domain/auth/usecases/password_reset_usecase.dart';

final sl = GetIt.instance;

void serviceLocator() {
  // sources
  sl.registerSingleton<AuthFirebaseSource>(
    AuthFirebaseSourceImpl(),
  );
  // repos
  sl.registerSingleton<AuthRepo>(
    AuthRepoImpl(),
  );
  // use cases
  sl.registerSingleton<SignupUsecase>(
    SignupUsecase(),
  );
  sl.registerSingleton<GetAgesUsecase>(
    GetAgesUsecase(),
  );
  sl.registerSingleton<SigninUsecase>(
    SigninUsecase(),
  );
  sl.registerSingleton<PasswordResetUsecase>(
    PasswordResetUsecase(),
  );
  sl.registerSingleton<IsLoggedInUsecase>(
    IsLoggedInUsecase(),
  );
  sl.registerSingleton<GetUserUsecase>(
    GetUserUsecase(),
  );
}
