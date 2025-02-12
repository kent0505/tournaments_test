import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/tour.dart';
import '../../core/utils.dart';

part 'tour_event.dart';
part 'tour_state.dart';

class TourBloc extends Bloc<TourEvent, TourState> {
  TourBloc() : super(TourInitial()) {
    on<LoadTours>((event, emit) async {
      await initDB();
      List<Tour> tours = await getTours();
      await Future.delayed(const Duration(seconds: 2));
      emit(ToursLoaded(tours: tours));
    });

    on<AddTour>((event, emit) async {
      List<Tour> tours = await getTours();
      tours.insert(0, event.tour);
      tours = await updateTours(tours);
      emit(ToursLoaded(tours: tours));
    });

    on<EditTour>((event, emit) async {
      List<Tour> tours = await getTours();
      for (Tour tour in tours) {
        if (tour.id == event.tour.id) {
          tour.title = event.tour.title;
        }
      }
      tours = await updateTours(tours);
      emit(ToursLoaded(tours: tours));
    });

    on<EditTitle>((event, emit) async {
      List<Tour> tours = await getTours();
      for (Tour tour in tours) {
        if (tour.id == event.id) tour.title = event.title;
      }
      tours = await updateTours(tours);
      emit(ToursLoaded(tours: tours));
    });

    on<DeleteTour>((event, emit) async {
      List<Tour> tours = await getTours();
      tours.removeWhere((model) => model.id == event.tour.id);
      tours = await updateTours(tours);
      emit(ToursLoaded(tours: tours));
    });
  }
}
