import 'package:alhawta/filter/filter_screen.dart';
import 'package:alhawta/home/widgets/home_custom_icon_btn.dart';
import 'package:alhawta/home/widgets/home_custom_product.dart';
import 'package:alhawta/home/widgets/home_custom_text_icon_btn.dart';
import 'package:alhawta/index/index_controller.dart';
import 'package:alhawta/utils/constants/custom_images.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/constants/custom_colors.dart';
import 'home_controller.dart';

class HomeScreen extends CustomState {
  const HomeScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(CustomImages.LOGO, width: 100, color: darkLightColor(context)),
                      const Spacer(),
                      HomeCustomIconBtn(onPressed: (){ IndexController.currentIndex.value = 1; }, icon: Iconsax.filter),
                      const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      HomeCustomIconBtn(onPressed: (){ Get.to( () => const FilterScreen(), arguments: "All" ); }, icon: Iconsax.search_normal),
                      const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      HomeCustomIconBtn(onPressed: (){ controller.onCloseTheApp(context: context); }, icon: Iconsax.arrow_right_3),
                    ],
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                  CarouselSlider.builder(
                    carouselController: controller.pageController,
                    options: CarouselOptions(
                      height: 200,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.4,
                      onPageChanged: (index, _) { controller.currentPageIndex.value = index; },
                      scrollDirection: Axis.vertical,
                    ),
                    itemCount: controller.carouselImages.length,
                    itemBuilder: (BuildContext context, int index, int realIndex) =>
                        ClipRRect(
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
                          child: InkWell(
                            overlayColor: MaterialStateProperty.all<Color>(CustomColors.TRANSPARENT),
                            onTap: (){},
                            child: Image.network(
                                controller.carouselImages[index],
                                fit: BoxFit.cover,
                                height: getWidth(context),
                                width: getWidth(context)),
                          ),
                        ),
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                  Row(
                    children: [
                      Text("Anonce Premium", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontFamily: "Pop_Bold", letterSpacing: 1)),
                      const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      const Icon(Iconsax.star5, color: CustomColors.GOLD, size: 22)
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            SizedBox(
              height: 210,
              child: ListView.builder(
                  itemCount: 2,
                  padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) =>
                      HomeCustomProduct(
                        imgUri: 'https://yourdesignstore.s3.amazonaws.com/uploads/yds/productImages/thumb/17119587213301Main-Product-Image.jpg',
                        title: "Jacket noir",
                        description: "Une jacket avec bon état pouvez-vous contacter moi.",
                        onClick: (id){},
                        price: 200,
                        isLiked: false,
                        bgColor: CustomColors.GOLD,
                      )),
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
            Container(
              height: 60,
              width: getWidth(context),
              color: greenColor(context),
              child: Center(child: Text("Ad banner", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: darkDarkLightLightColor(context)))),
            ),
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
              child: InkWell(
                onTap: (){},
                overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("New Added", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontFamily: "Pop_Bold", letterSpacing: 1)),
                    Text("View All", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: "Pop_Semi_Bold", color: greenColor(context), fontSize: 12.0)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            SizedBox(
              height: 210,
              child: ListView.builder(
                  itemCount: 8,
                  padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) =>
                      HomeCustomProduct(
                          imgUri:
                          'https://yourdesignstore.s3.amazonaws.com/uploads/yds/productImages/thumb/17119587213301Main-Product-Image.jpg',
                          title: "Jacket noir",
                          description: "Une jacket avec bon état pouvez-vous contacter moi.",
                          onClick: (id){},
                          isLiked: false,
                          price: 200
                      )),
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
            Container(
              height: 60,
              width: getWidth(context),
              color: greenColor(context),
              child: Center(child: Text("Ad banner", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: darkDarkLightLightColor(context)))),
            ),
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
              child: InkWell(
                onTap: (){},
                overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Top Collections", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontFamily: "Pop_Bold", letterSpacing: 1)),
                    Text("View All", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: "Pop_Semi_Bold", color: greenColor(context), fontSize: 12.0)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            SizedBox(
              height: 210,
              child: ListView.builder(
                  itemCount: 8,
                  padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) =>
                      HomeCustomProduct(
                          imgUri:
                          'https://yourdesignstore.s3.amazonaws.com/uploads/yds/productImages/thumb/17119587213301Main-Product-Image.jpg',
                          title: "Jacket noir",
                          description: "Une jacket avec bon état pouvez-vous contacter moi.",
                          onClick: (id){},
                          isLiked: false,
                          price: 200
                      )),
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
            Container(
              height: 60,
              width: getWidth(context),
              color: greenColor(context),
              child: Center(child: Text("Ad banner", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: darkDarkLightLightColor(context)))),
            ),
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
              child: InkWell(
                onTap: (){},
                overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Products", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontFamily: "Pop_Bold", letterSpacing: 1)),
                    Text("View All", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: "Pop_Semi_Bold", color: greenColor(context), fontSize: 12.0)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            SizedBox(
              height: 210,
              child: ListView.builder(
                  itemCount: 8,
                  padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) =>
                      HomeCustomProduct(
                          imgUri:
                          'https://yourdesignstore.s3.amazonaws.com/uploads/yds/productImages/thumb/17119587213301Main-Product-Image.jpg',
                          title: "Jacket noir",
                          description: "Une jacket avec bon état pouvez-vous contacter moi.",
                          onClick: (id){},
                          isLiked: false,
                          price: 200
                      )),
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
            HomeCustomTextIconBtn(onPressed: (){}, bgColor: grayColor(context).withOpacity(0.2), text: "More Products", icon: Iconsax.arrow_right_41),
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
            Container(
              height: 60,
              width: getWidth(context),
              color: greenColor(context),
              child: Center(child: Text("Ad banner", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: darkDarkLightLightColor(context)))),
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 3),
          ],
        ),
      ),
    );
  }
}