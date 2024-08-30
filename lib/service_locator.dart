import 'package:clot_shop/data/auth/repo/auth_repo_impl.dart';
import 'package:clot_shop/data/auth/source/auth_firebase_source.dart';
import 'package:clot_shop/domain/auth/repos/auth_repo.dart';
import 'package:clot_shop/domain/auth/usecases/get_ages_usecase.dart';
import 'package:clot_shop/domain/auth/usecases/get_user_usecase.dart';
import 'package:clot_shop/domain/auth/usecases/is_logged_in_usecase.dart';
import 'package:clot_shop/domain/auth/usecases/signin_usecase.dart';
import 'package:clot_shop/domain/auth/usecases/signup_usecase.dart';
import 'package:clot_shop/domain/category/usecases/get_categories_usecase.dart';
import 'package:get_it/get_it.dart';

import 'data/categories/repo/category_repo_impl.dart';
import 'data/categories/source/category_firebase_source.dart';
import 'domain/auth/usecases/password_reset_usecase.dart';
import 'domain/category/repos/category_repo.dart';

final sl = GetIt.instance;

void serviceLocator() {
  // sources
  sl.registerSingleton<AuthFirebaseSource>(
    AuthFirebaseSourceImpl(),
  );
  sl.registerSingleton<CategoryFirebaseSource>(
    CategoryFirebaseSourceImpl(),
  );

  // repos
  sl.registerSingleton<AuthRepo>(
    AuthRepoImpl(),
  );
  sl.registerSingleton<CategoryRepo>(
    CategoryRepoImpl(),
  );

  // use cases
  // auth
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

  // categories
  sl.registerSingleton<GetCategoriesUsecase>(
    GetCategoriesUsecase(),
  );
}
