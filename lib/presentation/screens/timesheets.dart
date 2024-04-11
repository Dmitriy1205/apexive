import 'package:apexive/core/const/icons.dart';
import 'package:apexive/core/const/strings.dart';
import 'package:apexive/core/theme/themes.dart';
import 'package:apexive/presentation/bloc/timer_card/timer_card_bloc.dart';
import 'package:apexive/presentation/bloc/timer_card/timer_card_state.dart';
import 'package:apexive/presentation/screens/create_timer.dart';
import 'package:apexive/presentation/screens/degails/details.dart';
import 'package:apexive/presentation/widgets/app_square_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/header.dart';
import '../widgets/timer_card.dart';

class TimersheetsScreen extends StatelessWidget {
  const TimersheetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<TimerCardBloc, TimerCardState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(
                    headerText: AppStrings.timesheets,
                    children: [
                      AppSquareButton(
                        borderRadius: 12,
                        child: SvgPicture.asset(
                          AppIcons.upDown,
                          height: 20.7,
                          width: 13,
                          fit: BoxFit.none,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      AppSquareButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateTimerScreen()));
                        },
                        borderRadius: 12,
                        child: SvgPicture.asset(
                          AppIcons.plus,
                          height: 20.7,
                          width: 13,
                          fit: BoxFit.none,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Text(
                    '${AppStrings.youHave} ${state.timers.length} ${AppStrings.timers} ',
                    style: AppTheme.defaultTheme.textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.timers.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                            timeCardIndex: index,
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: TimerCard(
                                timerModel: state.timers[index],
                                index: index,
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
