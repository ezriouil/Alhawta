import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';

class ProductCustomInfoTile extends CustomState {
  final String title, info;

  const ProductCustomInfoTile({super.key, required this.title, required this.info});

  @override
  Widget execute(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.normal)),
        Text(info, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: "Pop_Semi_Bold")
        ),
      ],
    );
  }
}
