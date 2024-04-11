import 'package:apexive/presentation/bloc/test/timer_bloc.dart';
import 'package:apexive/presentation/bloc/test/ticker.dart';
import 'package:apexive/presentation/bloc/timer_card/timer_card_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  Ticker ticker = const Ticker();

  sl.registerLazySingleton(() => TimerCardBloc());
  sl.registerLazySingleton(() => TimerBloc(
        ticker: ticker,
      ));
}
