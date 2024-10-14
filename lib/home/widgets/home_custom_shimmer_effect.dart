import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/constants/custom_sizes.dart';

class HomeCustomShimmerEffect extends CustomState {
  const HomeCustomShimmerEffect({super.key});

  @override
  Widget execute(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Shimmer.fromColors(
        baseColor: greenColor(context).withOpacity(0.2),
        highlightColor: greenColor(context).withOpacity(0.4),
        child: ListView.builder(
            itemCount: context.isTablet ? 10 : 5,
            padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              width: 150,
              margin: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS / 8),
              padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _container(context: context, height: 120),
                  _container(context: context),
                  _container(context: context),
                  _container(context: context),
                ],
              ),
            )
        ),
      ),
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
