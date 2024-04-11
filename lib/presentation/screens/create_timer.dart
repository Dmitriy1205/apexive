import 'package:apexive/core/theme/colors.dart';
import 'package:apexive/core/theme/themes.dart';
import 'package:apexive/presentation/bloc/timer_card/timer_card_bloc.dart';
import 'package:apexive/presentation/bloc/timer_card/timer_card_event.dart';
import 'package:apexive/presentation/widgets/app_checkbox.dart';
import 'package:apexive/presentation/widgets/app_elevated_button.dart';
import 'package:apexive/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/const/strings.dart';
import '../widgets/app_drop_down_button.dart';
import '../widgets/background.dart';

class CreateTimerScreen extends StatefulWidget {
  const CreateTimerScreen({super.key});

  @override
  State<CreateTimerScreen> createState() => _CreateTimerScreenState();
}

class _CreateTimerScreenState extends State<CreateTimerScreen> {
  final descriptionController = TextEditingController();
  final focusNode = FocusNode();
  String project = '';
  String task = '';
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            headerText: Text(
              AppStrings.createTimer,
              style: AppTheme.defaultTheme.textTheme.headlineSmall,
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                AppDropDownButton(
                  items: AppStrings.projectList,
                  value: AppStrings.project,
                  getValue: (value) {
                    setState(() {
                      project = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 28,
                ),
                AppDropDownButton(
                  items: AppStrings.taskList,
                  value: AppStrings.task,
                  getValue: (value) {
                    setState(() {
                      task = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 28,
                ),
                TextFormField(
                  controller: descriptionController,
                  maxLines: null,
                  focusNode: focusNode,
                  style: AppTheme.defaultTheme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                  cursorColor: AppColors.white,
                  decoration: InputDecoration(
                    hintText: AppStrings.description,
                    hintStyle: AppTheme.defaultTheme.textTheme.bodyMedium,
                  ),
                  onTapOutside: (_) {
                    focusNode.unfocus();
                  },
                  onChanged: (v) {
                    setState(() {
                      descriptionController.text = v;
                    });
                  },
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    AppCheckbox(
                        value: isFavorite,
                        onChanged: (v) {
                          setState(() {
                            isFavorite = v!;
                          });
                        },
                        borderColor: AppColors.white),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      AppStrings.makeFavorite,
                      style:
                          AppTheme.defaultTheme.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                AppElevatedButton(
                  text: AppStrings.createProject,
                  onPressed: project.isEmpty || task.isEmpty
                      ? null
                      : () {
                          context.read<TimerCardBloc>().add(
                                CreateTimer(
                                  project: project,
                                  task: task,
                                  description: descriptionController.text,
                                  isFavorite: false,
                                ),
                              );
                          Navigator.pop(context);
                        },
                  borderRadius: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    descriptionController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
