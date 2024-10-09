import 'package:alhawta/utils/constants/custom_images.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';

class FilterCustomEmpty extends CustomState{
  final String title, description;

   const FilterCustomEmpty({super.key, required this.title, required this.description});

  @override
  Widget execute(BuildContext context) {
    return Column(
      children: [
        Image.asset(CustomImages.EMPTY, height: 200, width: 200, fit: BoxFit.cover),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        Text(title, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontFamily: "Pop_Bold", wordSpacing: 2)),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        Text(description, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: grayColor(context)), textAlign: TextAlign.center)
      ],
    );
  }
}