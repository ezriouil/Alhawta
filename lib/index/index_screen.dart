import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'index_controller.dart';

class IndexScreen extends CustomState {
  const IndexScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final IndexController controller = Get.find<IndexController>();
    return Scaffold(
      body: Obx(
            () => Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Obx( () => controller.screens()[IndexController.currentIndex.value] ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(CustomSizes.SPACE_DEFAULT),
                    child: BottomBarFloating(
                      borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS * 2),
                      items: const [
                        TabItem(icon: Iconsax.home, title: "Explore"),
                        TabItem(icon: Iconsax.category, title: "Categories"),
                        TabItem(icon: Iconsax.heart, title: "Favorite"),
                        TabItem(icon: Iconsax.setting, title: "Settings"),
                      ],
                      backgroundColor: greenColor(context),
                      color: darkDarkLightLightColor(context).withOpacity(0.5),
                      colorSelected: darkDarkLightLightColor(context),
                      titleStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 10),
                      iconSize: 20,
                      animated: false,
                      indexSelected: IndexController.currentIndex.value,
                      onTap: controller.onUpdateCurrentIndex,
                      paddingVertical: 12.0,
                    ),
                  ),
                )
              ],
            ),
      )
    );
  }
}
