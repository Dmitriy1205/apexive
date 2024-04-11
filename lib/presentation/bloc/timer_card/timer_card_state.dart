import 'package:equatable/equatable.dart';

import '../../../data/models/timer.dart';

class TimerCardState extends Equatable {
  final List<TimerModel> timers;

  const TimerCardState({
    this.timers = const [],
  });

  @override
  List<Object?> get props => [timers];

  TimerCardState copyWith({
    List<TimerModel>? timers,
  }) {
    return TimerCardState(
      timers: timers ?? this.timers,
    );
  }
}
