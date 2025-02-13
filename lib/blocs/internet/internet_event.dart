part of 'internet_bloc.dart';

@immutable
sealed class InternetEvent {}

class CheckInternet extends InternetEvent {}

class ChangeStatus extends InternetEvent {
  ChangeStatus({required this.connected});

  final bool connected;
}
