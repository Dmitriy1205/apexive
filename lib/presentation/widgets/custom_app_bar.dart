import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/const/icons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget headerText;
  final bool isEditable;

  const CustomAppBar({
    super.key,
    required this.headerText,
    this.isEditable = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(AppIcons.arrowLeft)),
            headerText,
            isEditable ? SvgPicture.asset(AppIcons.pen) : const SizedBox(width: 20,),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
