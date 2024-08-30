part of 'category_display_cubit.dart';

@immutable
sealed class CategoryDisplayState {}

final class CategoryDisplayInitial extends CategoryDisplayState {}

final class CategoryDisplayLoading extends CategoryDisplayState {}

final class CategoryDisplaySuccess extends CategoryDisplayState {
  final List<CategoryEntity> category;

  CategoryDisplaySuccess({required this.category});
}

final class CategoryDisplayFailure extends CategoryDisplayState {
  final String message;

  CategoryDisplayFailure({required this.message});
}
