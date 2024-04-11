import 'dart:async';
import 'package:apexive/presentation/bloc/test/timer_event.dart';
import 'package:apexive/presentation/bloc/test/timer_state.dart';
import 'package:apexive/presentation/bloc/test/ticker.dart';
import 'package:bloc/bloc.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;

  late Map<String, int> durations = {};
  late Map<String, StreamSubscription<int>> subscriptions = {};

  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerInitial({})) {
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onPaused);
    on<TimerTicked>(_onTicked);
  }

  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    final timerId = event.id;
    emit(TimerRunInProgress(event.durations));
    if (subscriptions.containsKey(timerId)) {
      subscriptions[timerId]!.cancel();
    }
    subscriptions[timerId] =
        _ticker.tick(ticks: event.counter).listen((duration) {
      durations[timerId] = duration;
      add(TimerTicked(durations: Map<String, int>.from(durations)));
    });
  }

  void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
    if (state is TimerRunInProgress) {
      if (subscriptions.containsKey(event.id)) {
        subscriptions[event.id]!.pause();
      }
      emit(TimerRunPause(Map<String, int>.from(durations)));
    }
  }

  void _onTicked(TimerTicked event, Emitter<TimerState> emit) {
    final updatedDurations = Map<String, int>.from(state.durations);
    updatedDurations.addAll(event.durations);
    emit(TimerRunInProgress(updatedDurations));
  }

  @override
  Future<void> close() async {
    for (var entry in subscriptions.entries) {
      await entry.value.cancel();
    }
    return super.close();
  }
}
