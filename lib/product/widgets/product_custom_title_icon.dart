import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCustomTitleIcon extends CustomState {
  final String title;
  const ProductCustomTitleIcon({super.key, required this.title});

  @override
  Widget execute(BuildContext context) {
    return Row(
      children: [
        Icon(Iconsax.direct_right5, size: 14, color: darkLightColor(context)),
        const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        Text(title, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontFamily: "Pop_Bold")),
      ],
    );
  }
}
