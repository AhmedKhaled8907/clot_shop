import 'package:clot_shop/data/auth/repo/auth_repo_impl.dart';
import 'package:clot_shop/data/auth/source/auth_firebase_source.dart';
import 'package:clot_shop/data/order/sources/order_firebase_source.dart';
import 'package:clot_shop/data/product/source/Product_firebase_source.dart';
import 'package:clot_shop/domain/auth/repos/auth_repo.dart';
import 'package:clot_shop/domain/auth/usecases/get_ages_usecase.dart';
import 'package:clot_shop/domain/auth/usecases/get_user_usecase.dart';
import 'package:clot_shop/domain/auth/usecases/is_logged_in_usecase.dart';
import 'package:clot_shop/domain/auth/usecases/sign_out_usecase.dart';
import 'package:clot_shop/domain/auth/usecases/signin_usecase.dart';
import 'package:clot_shop/domain/auth/usecases/signup_usecase.dart';
import 'package:clot_shop/domain/category/usecases/get_categories_usecase.dart';
import 'package:clot_shop/domain/order/repo/order_repo.dart';
import 'package:clot_shop/domain/order/usecases/add_to_cart_usecase.dart';
import 'package:clot_shop/domain/order/usecases/delete_cart_usecase.dart';
import 'package:clot_shop/domain/order/usecases/delete_product_by_id_usecase.dart';
import 'package:clot_shop/domain/order/usecases/get_cart_products_usecase.dart';
import 'package:clot_shop/domain/order/usecases/get_orders_usecase.dart';
import 'package:clot_shop/domain/order/usecases/order_registration_usecase.dart';
import 'package:clot_shop/domain/product/repos/product_repo.dart';
import 'package:clot_shop/domain/product/usecases/add_or_remove_favorite_product_usecase.dart';
import 'package:clot_shop/domain/product/usecases/get_favorite_products_usecase.dart';
import 'package:clot_shop/domain/product/usecases/get_new_in_usecase.dart';
import 'package:clot_shop/domain/product/usecases/get_products_by_categories_usecase.dart';
import 'package:clot_shop/domain/product/usecases/get_top_selling_usecase.dart';
import 'package:clot_shop/domain/product/usecases/is_favorite_usecase.dart';
import 'package:get_it/get_it.dart';

import '../../data/categories/repo/category_repo_impl.dart';
import '../../data/categories/source/category_firebase_source.dart';
import '../../data/order/repo/order_repo_impl.dart';
import '../../data/product/repo/product_repo_impl.dart';
import '../../domain/auth/usecases/password_reset_usecase.dart';
import '../../domain/category/repos/category_repo.dart';
import '../../domain/product/usecases/get_product_by_title_usecase.dart';
import '../../presentation/root/bloc/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';

final sl = GetIt.instance;

void serviceLocator() {
  // blocs
  sl.registerFactory(() => BottomNavBarCubit());

  // sources
  sl.registerSingleton<AuthFirebaseSource>(
    AuthFirebaseSourceImpl(),
  );
  sl.registerSingleton<CategoryFirebaseSource>(
    CategoryFirebaseSourceImpl(),
  );
  sl.registerSingleton<ProductFirebaseSource>(
    ProductFirebaseSourceImpl(),
  );

  sl.registerSingleton<OrderFirebaseSource>(
    OrderFirebaseSourceImpl(),
  );

  // repos
  sl.registerSingleton<AuthRepo>(
    AuthRepoImpl(),
  );
  sl.registerSingleton<CategoryRepo>(
    CategoryRepoImpl(),
  );
  sl.registerSingleton<ProductRepo>(
    ProductRepoImpl(),
  );
  sl.registerSingleton<OrderRepo>(
    OrderRepoImpl(),
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
  sl.registerSingleton<SignOutUsecase>(
    SignOutUsecase(),
  );

  // categories
  sl.registerSingleton<GetCategoriesUsecase>(
    GetCategoriesUsecase(),
  );

  // top selling
  sl.registerSingleton<GetTopSellingUsecase>(
    GetTopSellingUsecase(),
  );

  // new in
  sl.registerSingleton<GetNewInUsecase>(
    GetNewInUsecase(),
  );

  // products by category
  sl.registerSingleton<GetProductsByCategoriesUseCase>(
    GetProductsByCategoriesUseCase(),
  );

  // products by title
  sl.registerSingleton<GetProductByTitleUsecase>(
    GetProductByTitleUsecase(),
  );

  // Orders
  // add to cart
  sl.registerSingleton<AddToCartUsecase>(
    AddToCartUsecase(),
  );

  // get cart products
  sl.registerSingleton<GetCartProductsUsecase>(
    GetCartProductsUsecase(),
  );

  // delete product by id
  sl.registerSingleton<DeleteProductByIdUsecase>(
    DeleteProductByIdUsecase(),
  );

  // delete cart
  sl.registerSingleton<DeleteCartUsecase>(
    DeleteCartUsecase(),
  );

  // order registration
  sl.registerSingleton<OrderRegistrationUsecase>(
    OrderRegistrationUsecase(),
  );

  // add or remove favorite product
  sl.registerSingleton<AddOrRemoveFavoriteProductUsecase>(
    AddOrRemoveFavoriteProductUsecase(),
  );

  // is favorite
  sl.registerSingleton<IsFavoriteUsecase>(
    IsFavoriteUsecase(),
  );

  // get favorite products
  sl.registerSingleton<GetFavoriteProductsUsecase>(
    GetFavoriteProductsUsecase(),
  );

  // get orders
  sl.registerSingleton<GetOrdersUsecase>(
    GetOrdersUsecase(),
  );
}
