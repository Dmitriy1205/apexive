import 'package:apexive/core/functions/generators.dart';
import 'package:apexive/data/models/timer.dart';
import 'package:apexive/presentation/bloc/timer_card/timer_card_event.dart';
import 'package:apexive/presentation/bloc/timer_card/timer_card_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class TimerCardBloc extends HydratedBloc<TimerCardEvent, TimerCardState> {
  TimerCardBloc() : super(const TimerCardState()) {
    on<ShowTimer>(_mapShowTimerToState);
    on<CreateTimer>(_mapCreateTimerToState);
    on<PlayPauseTimer>(_mapPlayPauseTimerToState);
    on<StopTimer>(_mapStopTimerToState);
  }

  Future<void> _mapShowTimerToState(
      ShowTimer event, Emitter<TimerCardState> emit) async {

    final List<dynamic> jsonList = List<TimerModel>.from(state.timers);
    if (jsonList.isEmpty) {
      emit(state.copyWith(
          timers: jsonList.map((json) => TimerModel.fromJson(json)).toList()));
    } else {
      return emit(state.copyWith(timers: []));
    }
  }

  Future<void> _mapCreateTimerToState(
      CreateTimer event, Emitter<TimerCardState> emit) async {
    final updatedTimers = List<TimerModel>.from(state.timers)
      ..add(TimerModel(
        id: generateID(),
        project: event.project,
        task: event.task,
        description: event.description,
        counter: 0,
        isPlaying: false,
        isStopped: false,
        isFavorite: event.isFavorite,
      ));
    emit(state.copyWith(timers: updatedTimers));
  }

  Future<void> _mapPlayPauseTimerToState(
      PlayPauseTimer event, Emitter<TimerCardState> emit) async {
    List<TimerModel> timers = List<TimerModel>.from(state.timers);
    TimerModel updatedTimer = timers[event.index];
    timers[event.index] = event.isPlaying
        ? updatedTimer.copyWith(
            isPlaying: !updatedTimer.isPlaying, counter: event.counter)
        : updatedTimer.copyWith(isPlaying: !updatedTimer.isPlaying);
    emit(state.copyWith(timers: timers));
  }

  Future<void> _mapStopTimerToState(
      StopTimer event, Emitter<TimerCardState> emit) async {
    List<TimerModel> timers = List<TimerModel>.from(state.timers);
    TimerModel updatedTimer = timers[event.index];
    timers[event.index] =
        updatedTimer.copyWith(isStopped: !updatedTimer.isStopped);
    emit(state.copyWith(timers: timers));
  }

  @override
  TimerCardState? fromJson(Map<String, dynamic> json) {
    final timersJson = json['timers'] as List<dynamic>?;
    if (timersJson != null) {
      final List<TimerModel> timers = timersJson.map((timerJson) {
        return TimerModel.fromJson(timerJson as Map<String, dynamic>);
      }).toList();
      return TimerCardState(timers: timers);
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(TimerCardState state) {
    final List<dynamic> timersJson =
        state.timers.map((timer) => timer.toJson()).toList();
    return {'timers': timersJson};
  }
}
