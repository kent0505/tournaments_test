import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/participant.dart';
import '../../core/tour.dart';
import '../../core/utils.dart';

part 'tour_event.dart';
part 'tour_state.dart';

class TourBloc extends Bloc<TourEvent, TourState> {
  TourBloc() : super(TourInitial()) {
    on<LoadTours>((event, emit) async {
      await getTours();
      await Future.delayed(const Duration(seconds: 2));
      emit(ToursLoaded(tours: toursList));
    });

    on<AddTour>((event, emit) async {
      toursList.insert(0, event.tour);
      await updateTours();
      emit(ToursLoaded(tours: toursList));
    });

    on<EditTour>((event, emit) async {
      for (Tour tour in toursList) {
        if (tour.id == event.tour.id) {
          tour.title = event.tour.title;
        }
      }
      await updateTours();
      emit(ToursLoaded(tours: toursList));
    });

    on<EditTitle>((event, emit) async {
      for (Tour tour in toursList) {
        if (tour.id == event.id) tour.title = event.title;
      }
      await updateTours();
      emit(ToursLoaded(tours: toursList));
    });

    on<DeleteTour>((event, emit) async {
      toursList.removeWhere((model) => model.id == event.tour.id);
      emit(ToursLoaded(tours: toursList));
    });

    on<UpdateTour>((event, emit) async {
      emit(ToursLoaded(tours: toursList));
    });
  }
}
