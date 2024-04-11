import 'package:apexive/data/models/timer.dart';
import 'package:apexive/presentation/bloc/test/timer_bloc.dart';
import 'package:apexive/presentation/bloc/test/timer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/const/icons.dart';
import '../../core/functions/formatting.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/themes.dart';
import '../bloc/test/timer_event.dart';
import '../bloc/timer_card/timer_card_bloc.dart';
import '../bloc/timer_card/timer_card_event.dart';

class TimerCard extends StatelessWidget {
  final TimerModel timerModel;
  final int index;

  const TimerCard({
    super.key,
    required this.timerModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {

        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColors.whiteTransparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const VerticalDivider(
                        width: 2,
                        color: AppColors.yellow,
                        thickness: 2,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        width: 207,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.star,
                                  height: 21,
                                  width: 21,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                    child: Text(
                                  timerModel.project,
                                  style: AppTheme
                                      .defaultTheme.textTheme.titleMedium,
                                ))
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.bag,
                                  height: 21,
                                  width: 21,
                                  fit: BoxFit.none,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    timerModel.task,
                                    style: AppTheme
                                        .defaultTheme.textTheme.bodyMedium,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.time,
                                  height: 24,
                                  width: 24,
                                  fit: BoxFit.none,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    'Deadline 07/20/2023',
                                    style: AppTheme
                                        .defaultTheme.textTheme.bodyMedium,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  timerModel.isStopped
                      ? InkWell(
                          splashColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(64),
                          child: Container(
                            width: 104,
                            height: 48,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(64),
                            ),
                            child: Center(
                              child: Text('Finished',
                                  style: AppTheme
                                      .defaultTheme.textTheme.titleSmall!
                                      .copyWith(color: Colors.black)),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            context.read<TimerCardBloc>().add(PlayPauseTimer(
                                isPlaying: timerModel.isPlaying,
                                index: index,
                                timerModel: timerModel,
                                counter:  state.durations[timerModel.id] ?? timerModel.counter));

                            timerModel.isPlaying
                                ? context
                                    .read<TimerBloc>()
                                    .add(TimerPaused(id: timerModel.id))
                                : context.read<TimerBloc>().add(TimerStarted(
                                    durations: state.durations,
                                    id: timerModel.id, counter: timerModel.counter));
                          },
                          splashColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(64),
                          child: Container(
                            width: 104,
                            height: 48,
                            decoration: BoxDecoration(
                              color: timerModel.isPlaying
                                  ? AppColors.white
                                  : AppColors.whiteTransparent,
                              borderRadius: BorderRadius.circular(64),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  formatDuration(state.durations[timerModel.id] ?? timerModel.counter)
                                      .split(':')
                                      .sublist(1)
                                      .join(':'),
                                  style: AppTheme
                                      .defaultTheme.textTheme.labelLarge!
                                      .copyWith(
                                          color: timerModel.isPlaying
                                              ? Colors.black
                                              : AppColors.white),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                SvgPicture.asset(timerModel.isPlaying
                                    ? AppIcons.pause
                                    : AppIcons.play),
                              ],
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
