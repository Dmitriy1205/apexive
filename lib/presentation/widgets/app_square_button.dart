import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';

class AppSquareButton extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double borderRadius;
  final VoidCallback? onTap;
  
  const AppSquareButton({super.key, required this.child, this.onTap, required this.borderRadius, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
            color:color ?? AppColors.whiteTransparent,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: child,
      ),
    );
  }
}
