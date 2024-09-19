import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/category/entities/category_entity.dart';
import '../../../../../domain/category/repos/category_repo.dart';
import '../../../../../core/services/service_locator.dart';

part 'category_display_state.dart';

class CategoryDisplayCubit extends Cubit<CategoryDisplayState> {
  CategoryDisplayCubit() : super(CategoryDisplayInitial());

  Future<void> getCategories() async {
    emit(CategoryDisplayLoading());

    var categories = await sl<CategoryRepo>().getCategories();
    categories.fold(
      (error) => emit(
        CategoryDisplayFailure(message: error),
      ),
      (data) => emit(
        CategoryDisplaySuccess(category: data),
      ),
    );
  }
}
