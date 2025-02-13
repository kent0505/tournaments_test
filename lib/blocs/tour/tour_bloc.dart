import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/tour.dart';
import '../../core/utils.dart';

part 'tour_event.dart';
part 'tour_state.dart';

class TourBloc extends Bloc<TourEvent, TourState> {
  TourBloc() : super(TourInitial()) {
    on<LoadTours>((event, emit) async {
      await getTours();
      await Future.delayed(const Duration(seconds: 2));
      emit(ToursLoaded());
    });

    on<UpdateTour>((event, emit) async {
      emit(ToursLoaded());
    });

    on<AddTour>((event, emit) async {
      toursList.insert(0, event.tour);
      await updateTours();
      emit(ToursLoaded());
    });

    on<EditTitle>((event, emit) async {
      for (Tour tour in toursList) {
        if (tour.id == event.id) tour.title = event.title;
      }
      await updateTours();
      emit(ToursLoaded());
    });

    on<FinishTour>((event, emit) async {
      for (Tour tour in toursList) {
        if (tour.id == event.tour.id) {
          tour.id = getTimestamp();
          tour.finished = true;
          tour.winner = event.tour.winner;
        }
      }
      await updateTours();
      emit(ToursLoaded());
    });

    on<DeleteTour>((event, emit) async {
      toursList.removeWhere((model) => model.id == event.tour.id);
      await updateTours();
      emit(ToursLoaded());
    });

    on<ClearData>((event, emit) async {
      toursList = [];
      await updateTours();
      emit(ToursLoaded());
    });
  }
}
