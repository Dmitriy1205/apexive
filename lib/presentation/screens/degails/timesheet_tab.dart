import 'package:apexive/core/const/icons.dart';
import 'package:apexive/core/const/strings.dart';
import 'package:apexive/core/functions/formatting.dart';
import 'package:apexive/core/theme/colors.dart';
import 'package:apexive/core/theme/themes.dart';
import 'package:apexive/presentation/bloc/timer_card/timer_card_bloc.dart';
import 'package:apexive/presentation/widgets/app_square_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/test/timer_bloc.dart';
import '../../bloc/test/timer_event.dart';
import '../../bloc/test/timer_state.dart';
import '../../bloc/timer_card/timer_card_event.dart';
import '../../bloc/timer_card/timer_card_state.dart';

class TimesheetTab extends StatelessWidget {
  final int timeCardIndex;

  const TimesheetTab({
    super.key,
    required this.timeCardIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCardBloc, TimerCardState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.whiteTransparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: BlocBuilder<TimerBloc, TimerState>(
                  builder: (context, timerState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.monday,
                          style: AppTheme.defaultTheme.textTheme.bodySmall!
                              .copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            AppStrings.date,
                            style: AppTheme.defaultTheme.textTheme.titleMedium,
                          ),
                        ),
                        Text(
                          'Start Time 10:00',
                          style: AppTheme.defaultTheme.textTheme.bodySmall!
                              .copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              formatDuration(timerState.durations[
                                      state.timers[timeCardIndex].id] ??
                                  state.timers[timeCardIndex].counter),
                              style:
                                  AppTheme.defaultTheme.textTheme.displaySmall,
                            ),
                            state.timers[timeCardIndex].isStopped
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
                                        child: Text(
                                          'Finished',
                                          style: AppTheme.defaultTheme.textTheme
                                              .titleSmall!
                                              .copyWith(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )
                                : Row(
                                    children: [
                                      AppSquareButton(
                                        onTap: () {
                                          context.read<TimerCardBloc>().add(
                                              StopTimer(index: timeCardIndex));
                                        },
                                        borderRadius: 64,
                                        child: SvgPicture.asset(
                                          AppIcons.stop,
                                          height: 20.7,
                                          width: 13,
                                          fit: BoxFit.none,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      AppSquareButton(
                                        onTap: () {
                                          context.read<TimerCardBloc>().add(
                                                PlayPauseTimer(
                                                  isPlaying: state
                                                      .timers[timeCardIndex]
                                                      .isPlaying,
                                                  index: timeCardIndex,
                                                  timerModel: state
                                                      .timers[timeCardIndex],
                                                  counter: 0,
                                                ),
                                              );
                                          state.timers[timeCardIndex].isPlaying
                                              ? context.read<TimerBloc>().add(
                                                  TimerPaused(
                                                      id: state
                                                          .timers[timeCardIndex]
                                                          .id))
                                              : context.read<TimerBloc>().add(
                                                  TimerStarted(
                                                      durations:
                                                          timerState.durations,
                                                      id: state
                                                          .timers[timeCardIndex]
                                                          .id,
                                                      counter: state
                                                          .timers[timeCardIndex]
                                                          .counter));
                                        },
                                        borderRadius: 64,
                                        color: state
                                                .timers[timeCardIndex].isPlaying
                                            ? AppColors.white
                                            : AppColors.whiteTransparent,
                                        child: SvgPicture.asset(
                                          state.timers[timeCardIndex].isPlaying
                                              ? AppIcons.pause
                                              : AppIcons.play,
                                          height: 20.7,
                                          width: 13,
                                          fit: BoxFit.none,
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Divider(
                          color: AppColors.whiteTransparent,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.description,
                              style: AppTheme.defaultTheme.textTheme.bodySmall!
                                  .copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                            SvgPicture.asset(AppIcons.pen)
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          context
                              .read<TimerCardBloc>()
                              .state
                              .timers[timeCardIndex]
                              .description,
                          style: AppTheme.defaultTheme.textTheme.bodyMedium,
                        )
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
