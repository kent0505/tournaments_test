import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final _connectivity = Connectivity();

  InternetBloc() : super(InternetInitial()) {
    on<InternetEvent>(
      (event, emit) => switch (event) {
        CheckInternet() => _checkInternet(event, emit),
        ChangeInternet() => changeInternet(event, emit),
      },
    );
  }

  void _checkInternet(
    CheckInternet event,
    Emitter<InternetState> emit,
  ) {
    _connectivity.onConnectivityChanged.listen((result) {
      if (result.contains(ConnectivityResult.mobile)) {
        add(ChangeInternet(connected: true));
      } else if (result.contains(ConnectivityResult.wifi)) {
        add(ChangeInternet(connected: true));
      } else {
        add(ChangeInternet(connected: false));
      }
    });
  }

  void changeInternet(
    ChangeInternet event,
    Emitter<InternetState> emit,
  ) {
    // event.connected ? emit(InternetSuccess()) : emit(InternetFailure());
    emit(InternetSuccess());
  }
}
