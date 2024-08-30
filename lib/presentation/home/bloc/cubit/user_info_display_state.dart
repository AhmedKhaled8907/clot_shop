part of 'user_info_display_cubit.dart';

@immutable
sealed class UserInfoDisplayState {}

final class UserInfoDisplayInitial extends UserInfoDisplayState {}

final class UserInfoDisplayLoading extends UserInfoDisplayState {}

final class UserInfoDisplaySuccess extends UserInfoDisplayState {
  final UserEntity user;

  UserInfoDisplaySuccess({required this.user});
}

final class UserInfoDisplayFailure extends UserInfoDisplayState {
  final String errMessage;

  UserInfoDisplayFailure({required this.errMessage});
}
