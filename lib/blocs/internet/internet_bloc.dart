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
        ChangeStatus() => changeStatus(event, emit),
      },
    );
  }

  void _checkInternet(
    CheckInternet event,
    Emitter<InternetState> emit,
  ) {
    _connectivity.onConnectivityChanged.listen((result) {
      if (result.contains(ConnectivityResult.mobile)) {
        add(ChangeStatus(connected: true));
      } else if (result.contains(ConnectivityResult.wifi)) {
        add(ChangeStatus(connected: true));
      } else {
        add(ChangeStatus(connected: false));
      }
    });
  }

  void changeStatus(
    ChangeStatus event,
    Emitter<InternetState> emit,
  ) {
    event.connected ? emit(InternetSuccess()) : emit(InternetFailure());
    // emit(InternetSuccess());
  }
}
