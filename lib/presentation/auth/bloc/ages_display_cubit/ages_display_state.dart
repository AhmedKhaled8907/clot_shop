part of 'ages_display_cubit.dart';

@immutable
sealed class AgesDisplayState {}

final class AgesDisplayInitial extends AgesDisplayState {}

final class AgesDisplayLoading extends AgesDisplayState {}

final class AgesDisplayLoaded extends AgesDisplayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> ages;

  AgesDisplayLoaded({required this.ages});
}

final class AgesDisplayFailure extends AgesDisplayState {
  final String errMessage;

  AgesDisplayFailure({required this.errMessage});
}
