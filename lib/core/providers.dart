import 'package:apexive/core/service_locator.dart';
import 'package:apexive/presentation/bloc/test/timer_bloc.dart';
import 'package:apexive/presentation/bloc/timer_card/timer_card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Providers extends StatelessWidget {
  final Widget child;

  const Providers({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<TimerCardBloc>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => sl<TimerBloc>(),
          lazy: false,
        ),
      ],
      child: child,
    );
  }
}
