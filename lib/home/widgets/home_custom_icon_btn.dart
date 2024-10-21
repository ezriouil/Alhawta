import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';

class HomeCustomIconBtn extends CustomState{
  final GestureTapCallback onPressed;
  final IconData icon;
  final double? size;
  final Color? iconColor, backgroundColor;

   const HomeCustomIconBtn({super.key, required this.onPressed, required this.icon,  this.iconColor, this.backgroundColor, this.size = 36.0});

  @override
  Widget execute(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS),
          border: Border.all(color: iconColor ?? darkLightColor(context), width: 0.4),
          color: backgroundColor ?? grayColor(context).withOpacity(0.2)),
      child: InkWell(
        overlayColor: MaterialStateProperty.all<Color>(CustomColors.TRANSPARENT),
        onTap: onPressed,
        child: Icon(icon, color: iconColor ?? darkLightColor(context), size: 16.0),
      ),
    );
  }
}