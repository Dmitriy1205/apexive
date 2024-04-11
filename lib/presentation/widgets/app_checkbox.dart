
import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';

class AppCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Color borderColor;

  const AppCheckbox({super.key,
    required this.value,
    required this.onChanged,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged?.call(!value);
      },
      child: Container(
        width: 17,
        height: 17,
        decoration: BoxDecoration(
          color: value ? AppColors.white :Colors.transparent,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color:value ? AppColors.white : borderColor,
            width: 1.5,
          ),
        ),
        child: value
            ? const Center(
              child: Icon(
          Icons.check,
          color: AppColors.backgroundTop,
          size: 14,
        ),
            )
            : null,
      ),
    );
  }
}
