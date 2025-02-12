part of 'tour_bloc.dart';

@immutable
sealed class TourState {}

final class TourInitial extends TourState {}

final class ToursLoaded extends TourState {
  ToursLoaded({required this.tours});

  final List<Tour> tours;
}
