part of 'tour_bloc.dart';

@immutable
sealed class TourEvent {}

final class LoadTours extends TourEvent {}

final class UpdateTour extends TourEvent {}

final class AddTour extends TourEvent {
  AddTour({required this.tour});

  final Tour tour;
}

final class EditTitle extends TourEvent {
  EditTitle({required this.id, required this.title});

  final int id;
  final String title;
}

final class FinishTour extends TourEvent {
  FinishTour({required this.tour});

  final Tour tour;
}

final class DeleteTour extends TourEvent {
  DeleteTour({required this.tour});

  final Tour tour;
}

final class ClearData extends TourEvent {}
