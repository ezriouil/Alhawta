import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';

class ProductCustomDivider extends CustomState {
  const ProductCustomDivider({super.key});

  @override
  Widget execute(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        Divider(color: grayColor(context). withOpacity(0.4), thickness: 0.6),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
      ],
    );
  }
}
