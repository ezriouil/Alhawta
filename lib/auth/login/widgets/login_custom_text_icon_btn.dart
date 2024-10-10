import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';

class LoginCustomTextIconBtn extends CustomState{
  final GestureTapCallback onPressed;
  final Color bgColor;
  final String icon, text;


   const LoginCustomTextIconBtn({super.key, required this.onPressed, required this.bgColor, required this.text, required this.icon});

  @override
  Widget execute(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS, vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        backgroundColor: bgColor,
        shadowColor: bgColor,
        side: BorderSide.none,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2))),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            height: 28,
            width: 28,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Image.asset(icon),
          ),
          const Spacer(),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: CustomColors.WHITE),
          ),
          const Spacer(),
        ],
      ),
    );
  }

}