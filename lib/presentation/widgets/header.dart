import 'package:flutter/material.dart';

import '../../core/theme/themes.dart';

class Header extends StatelessWidget {
  final String headerText;
  final List<Widget>? children;

  const Header({
    super.key,
    required this.headerText,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headerText,
          style: AppTheme.defaultTheme.textTheme.headlineLarge,
        ),
        Row(
          children: children ?? [],
        )
      ],
    );
  }
}
