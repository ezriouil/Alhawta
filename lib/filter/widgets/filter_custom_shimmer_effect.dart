import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/constants/custom_sizes.dart';

class FilterCustomShimmerEffect extends CustomState {
  const FilterCustomShimmerEffect({super.key});

  @override
  Widget execute(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: greenColor(context).withOpacity(0.2),
      highlightColor: greenColor(context).withOpacity(0.4),
      child: GridView.builder(
          padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.isTablet ? 4 : 2,
              mainAxisExtent: 260,
              mainAxisSpacing: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
              crossAxisSpacing: 2.0
          ),
          itemCount: context.isTablet ? 16 : 8,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) => Container(
            margin: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _container(context: context, height: 180),
                _container(context: context),
                _container(context: context),
                _container(context: context),
              ],
            ),
          )
      )
    );
  }

  Container _container({ required BuildContext context, double? height}) {
    return Container(
      width: getWidth(context),
      height: height ?? 20,
      decoration: BoxDecoration(
          color: grayColor(context),
          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS)),
    );
  }

}
