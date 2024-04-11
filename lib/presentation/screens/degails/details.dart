import 'package:apexive/core/const/strings.dart';
import 'package:apexive/core/theme/colors.dart';
import 'package:apexive/presentation/screens/degails/details_tab.dart';
import 'package:apexive/presentation/screens/degails/timesheet_tab.dart';
import 'package:apexive/presentation/widgets/background.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/themes.dart';
import '../../widgets/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  final int timeCardIndex;

  const DetailsScreen({
    super.key,
    required this.timeCardIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: CustomAppBar(
              isEditable: true,
              headerText: Text(
                'Get to know Apexer - Ivan',
                style: AppTheme.defaultTheme.textTheme.titleMedium,
              ),
            ),
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: AppColors.white,
                    indicatorWeight: 0.5,
                    dividerHeight: 0.5,
                    automaticIndicatorColorAdjustment: false,
                    dividerColor: AppColors.whiteTransparent,
                    tabs: [
                      Tab(
                          icon: Text(
                        AppStrings.timesheets,
                        style: AppTheme.defaultTheme.textTheme.labelLarge,
                      )),
                      Tab(
                          icon: Text(
                        AppStrings.details,
                        style: AppTheme.defaultTheme.textTheme.labelLarge,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        TimesheetTab(
                          timeCardIndex: timeCardIndex,
                        ),
                        const DetailTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
