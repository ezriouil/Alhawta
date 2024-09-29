import 'package:alhawta/home/widgets/home_custom_elevated_btn.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late CarouselController pageController;
  late RxInt currentPageIndex;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    pageController = CarouselController();
    currentPageIndex = 0.obs;
  }

  // - - - - - - - - - - - - - - - - - - GET ALL PRODUCTS - - - - - - - - - - - - - - - - - -  //


  // - - - - - - - - - - - - - - - - - - CAROUSEL IMAGES - - - - - - - - - - - - - - - - - -  //
  final carouselImages = [
    "https://ma.jumia.is/cms/000_2024/000001_Janvier/SodesHiver/UND/TV/SX.gif",
    "https://wowslider.com/sliders/demo-93/data1/images/landscape.jpg",
    "https://ma.jumia.is/cms/000_2024/000001_Janvier/SodesHiver/SX_Solde.jpg"
  ];

  void onCloseTheApp({required BuildContext context}) async{
    await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext innerContext) => AlertDialog(
      content: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

            // - - - - - - - - - - - - - - - - - -  TITLE - - - - - - - - - - - - - - - - - -  //
            Text(
              "Close The Application",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(letterSpacing: 0.6, fontFamily: "Pop_Semi_Bold"),
            ),

            // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

            // - - - - - - - - - - - - - - - - - -  SUB TITLE 1 - - - - - - - - - - - - - - - - - -  //
            Text(
                "By clicking on Close button you will destroy the application completely.",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12)
            ),

            // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
            Row(
              children: [
                Expanded(
                  child: HomeCustomElevatedBtn(
                    onPressed: (){ Get.back(); },
                    text: "Dismiss",
                    bgColor: CustomColors.GRAY_LIGHT,
                  ),
                ),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                Expanded(
                  child: HomeCustomElevatedBtn(
                    onPressed: (){ Get.back(); },
                    text: "Close",
                    bgColor: CustomColors.RED_DARK,
                    textColor: CustomColors.WHITE,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    )
    );
  }

}