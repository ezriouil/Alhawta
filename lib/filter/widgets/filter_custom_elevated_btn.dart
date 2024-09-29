import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';

class FilterCustomElevatedBtn extends CustomState{
  final GestureTapCallback onPressed;
  final Color bgColor;
  final String text;


   const FilterCustomElevatedBtn({super.key, required this.onPressed, required this.bgColor, required this.text});

  @override
  Widget execute(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      height: CustomSizes.SPACE_DEFAULT * 2,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS, vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          backgroundColor: bgColor,
          shadowColor: bgColor,
          side: BorderSide.none,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2))),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: darkDarkLightLightColor(context)),
        ),
      ),
    );
  }
}