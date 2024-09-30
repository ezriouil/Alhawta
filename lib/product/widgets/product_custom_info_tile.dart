import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/custom_sizes.dart';

class ProductCustomInfoTile extends CustomState {
  final String title, info;

  const ProductCustomInfoTile({super.key, required this.title, required this.info});

  @override
  Widget execute(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: "Pop_Semi_Bold")),
        Text(info, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontFamily: "Pop_Semi_Bold")
        ),
      ],
    );
  }
}
