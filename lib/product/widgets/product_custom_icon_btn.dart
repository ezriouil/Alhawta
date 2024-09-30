import 'package:alhawta/utils/constants/custom_images.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';

class ProductCustomIconBtn extends CustomState{
  final GestureTapCallback onPressed;
  final Color bgColor;
  final Color? textColor;
  final String text, img;


   const ProductCustomIconBtn({super.key, required this.onPressed, this.textColor, required this.bgColor, required this.text, required this.img});

  @override
  Widget execute(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      height: CustomSizes.SPACE_DEFAULT * 2,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS, vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          backgroundColor: bgColor,
          elevation: 0,
          shadowColor: bgColor,
          side: BorderSide.none,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2))),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(img, color: darkDarkLightLightColor(context)),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: textColor ?? darkDarkLightLightColor(context)),
            ),
          ],
        ),
      ),
    );
  }
}