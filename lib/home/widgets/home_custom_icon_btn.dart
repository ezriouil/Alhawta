import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';

class HomeCustomIconBtn extends CustomState{
  final GestureTapCallback onPressed;
  final IconData icon;

   const HomeCustomIconBtn({super.key, required this.onPressed, required this.icon});

  @override
  Widget execute(BuildContext context) {
    return Container(
      width: 36.0,
      height: 36.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS),
          border: Border.all(color: darkLightColor(context), width: 0.4),
          color: grayColor(context).withOpacity(0.2)),
      child: InkWell(
        overlayColor: MaterialStateProperty.all<Color>(CustomColors.TRANSPARENT),
        onTap: onPressed,
        child: Icon(icon, color: darkLightColor(context), size: 16.0),
      ),
    );
  }
}