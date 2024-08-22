import 'package:clot_shop/data/repo/auth_repo_impl.dart';
import 'package:clot_shop/data/source/auth_firebase_source.dart';
import 'package:clot_shop/domain/auth/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

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
}
