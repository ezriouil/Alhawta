import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';

class HomeCustomTextIconBtn extends CustomState{
  final GestureTapCallback onPressed;
  final Color bgColor;
  final String text;
  final IconData icon;


   const HomeCustomTextIconBtn({super.key, required this.onPressed, required this.bgColor, required this.text, required this.icon});

  @override
  Widget execute(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
          backgroundColor: bgColor,
          shadowColor: bgColor,
          side: BorderSide(color: darkLightColor(context)),
          elevation: 0,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS))),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 22, color: darkLightColor(context)),
            const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: darkLightColor(context), fontFamily: "Pop_Semi_Bold"),
            ),
          ],
        ),
      ),
    );
  }

}