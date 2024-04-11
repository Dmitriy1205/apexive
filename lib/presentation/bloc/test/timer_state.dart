import 'package:equatable/equatable.dart';

sealed class TimerState extends Equatable {
  const TimerState(this.durations);

  final Map<String, int> durations;

  @override
  List<Object> get props => [durations];
}

final class TimerInitial extends TimerState {
  const TimerInitial(super.durations);
}

final class TimerRunPause extends TimerState {
  const TimerRunPause(super.durations);
}

final class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.durations);
}
