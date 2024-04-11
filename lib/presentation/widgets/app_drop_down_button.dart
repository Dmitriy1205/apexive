import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/const/icons.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/themes.dart';

class AppDropDownButton extends StatefulWidget {
  final String value;
  final List<String> items;
  final Function(String) getValue;

  const AppDropDownButton(
      {super.key, required this.value, required this.items, required this.getValue});

  @override
  State<AppDropDownButton> createState() => _AppDropDownButtonState();
}

class _AppDropDownButtonState extends State<AppDropDownButton> {
  late String value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButtonFormField(
        elevation: 0,
        style: AppTheme.defaultTheme.textTheme.titleMedium,
        value: value,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        isDense: true,
        dropdownColor: AppColors.backgroundBottom,
        borderRadius: BorderRadius.circular(10),
        decoration: const InputDecoration(
            contentPadding:
                EdgeInsets.only(left: 5, right: 20, top: 14, bottom: 14)),
        icon: RotatedBox(
          quarterTurns: 3,
          child: SvgPicture.asset(
            AppIcons.arrowLeft,
          ),
        ),
        onChanged: (v) {
          setState(() {
            value = v.toString();
          });
          widget.getValue(value);
        },
        items: List.generate(
          widget.items.length,
          (index) => index == 0
              ? DropdownMenuItem(
                  enabled: false,
                  value: widget.items[index],
                  child: Text(
                    widget.items[index],
                    style:
                        AppTheme.defaultTheme.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              : DropdownMenuItem(
                  value: widget.items[index],
                  child: Text(
                    widget.items[index],
                  ),
                ),
        ),
      ),
    );
  }
}
