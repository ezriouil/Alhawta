import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';

class WishListCustomBtn extends CustomState{
  final GestureTapCallback onPressed;
  final Color bgColor;
  final String title;


   const WishListCustomBtn({super.key, required this.onPressed, required this.bgColor, required this.title});

  @override
  Widget execute(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      overlayColor: MaterialStateProperty.all<Color>(CustomColors.TRANSPARENT),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 4, horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: darkLightColor(context)),
          borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT),
        ),
        child: Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: darkDarkLightLightColor(context), fontSize: 12)),
      ),
    );
  }
}