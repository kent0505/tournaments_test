part of 'tour_bloc.dart';

@immutable
sealed class TourEvent {}

final class LoadTours extends TourEvent {}

class AddTour extends TourEvent {
  AddTour({required this.tour});

  final Tour tour;
}

class EditTour extends TourEvent {
  EditTour({required this.tour});

  final Tour tour;
}

class EditTitle extends TourEvent {
  EditTitle({required this.id, required this.title});

  final int id;
  final String title;
}

class DeleteTour extends TourEvent {
  DeleteTour({required this.tour});

  final Tour tour;
}
