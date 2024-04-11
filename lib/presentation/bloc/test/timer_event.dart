sealed class TimerEvent {
  const TimerEvent();
}

final class TimerStarted extends TimerEvent {
  const TimerStarted({
    required this.durations,
    required this.id,
    required this.counter,
  });

  final Map<String, int> durations;
  final String id;
  final int counter;
}

final class TimerPaused extends TimerEvent {
  final String id;

  const TimerPaused({
    required this.id,
  });
}

class TimerTicked extends TimerEvent {
  const TimerTicked({required this.durations});

  final Map<String, int> durations;
}
