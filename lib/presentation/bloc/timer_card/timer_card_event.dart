import 'package:equatable/equatable.dart';

import '../../../data/models/timer.dart';

abstract class TimerCardEvent extends Equatable {
  const TimerCardEvent();

  @override
  List<Object?> get props => [];
}

class ShowTimer extends TimerCardEvent {}

class CreateTimer extends TimerCardEvent {
  final String project;
  final String task;
  final String description;
  final bool isFavorite;

  const CreateTimer({
    required this.project,
    required this.task,
    required this.description,
    required this.isFavorite,
  });

  @override
  List<Object?> get props => [
        project,
        task,
        description,
        isFavorite,
      ];
}

class PlayPauseTimer extends TimerCardEvent {
  final bool isPlaying;
  final int counter;
  final int index;
  final TimerModel timerModel;

  const PlayPauseTimer({
    required this.isPlaying,
    required this.index,
    required this.timerModel,
    required this.counter,
  });

  @override
  List<Object?> get props => [isPlaying, index, timerModel, counter];
}

class StopTimer extends TimerCardEvent {
  final int index;

  const StopTimer({required this.index});
  @override
  List<Object?> get props => [index];
}
