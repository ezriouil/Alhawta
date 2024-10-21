import 'package:alhawta/filter/filter_screen.dart';
import 'package:alhawta/home/widgets/home_custom_icon_btn.dart';
import 'package:alhawta/home/widgets/home_custom_product.dart';
import 'package:alhawta/home/widgets/home_custom_shimmer_effect.dart';
import 'package:alhawta/home/widgets/home_custom_text_icon_btn.dart';
import 'package:alhawta/product/product_screen.dart';
import 'package:alhawta/utils/ads/custom_unity.dart';
import 'package:alhawta/utils/constants/custom_images.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
      appBar: AppBar(
        leading: Image.asset(CustomImages.LOGO, width: 100, color: darkLightColor(context)),
        leadingWidth: 100,
        actions: [
          HomeCustomIconBtn(onPressed: (){ Get.to( () => const FilterScreen(), arguments: "All" ); }, icon: Iconsax.search_normal),
          const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(
                () => Column(
                  children: [
                    const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                    Padding(
                      padding:  const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider.builder(
                            carouselController: controller.pageController,
                            options: CarouselOptions(
                              height: context.isTablet ? 400 : 200,
                              viewportFraction: 1,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              enlargeCenterPage: true,
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
                                    child: CachedNetworkImage(
                                      imageUrl: controller.carouselImages[index],
                                      height: getHeight(context),
                                      width: getWidth(context),
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder: (context, url, downloadProgress){
                                        return Container(
                                            width: getWidth(context),
                                            height: 170,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: grayColor(context)),
                                                borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS)
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(width: 28, height: 28, child: CircularProgressIndicator(strokeWidth: 1, color: darkLightColor(context), backgroundColor: grayColor(context), value: downloadProgress.progress)),
                                                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                                                Text(downloadProgress.progress != null ? "${(downloadProgress.progress! * 100).toStringAsFixed(2)} %" : "Loading", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14.0, fontWeight: FontWeight.w300))
                                              ],
                                            )
                                        );
                                      },
                                      errorWidget: (context, url, error) => Container(
                                          width: getWidth(context),
                                          height: 170,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: grayColor(context)),
                                              borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS)),
                                          child: Icon(Iconsax.gallery_remove, size: 30.0, color: grayColor(context))),
                                    ),
                                  ),
                                ),
                          ),
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                          Row(
                            children: [
                              Text("Announce Premium", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontFamily: "Pop_Bold", wordSpacing: 1)),
                              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                              const Icon(Iconsax.star5, color: CustomColors.GOLD, size: 22)
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                    controller.products.isEmpty ? const HomeCustomShimmerEffect() : SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount: controller.products.length,
                          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) =>
                              HomeCustomProduct(
                                imgUri: 'https://images.pexels.com/photos/40896/larch-conifer-cone-branch-tree-40896.jpeg?auto=compress&cs=tinysrgb&w=1200',
                                title: "Jacket noir ${controller.products[index]}.",
                                description: "Une jacket avec bon état pouvez-vous contacter moi.",
                                onClick: (id){ Get.to( () => const ProductScreen(), arguments: id); },
                                price: 200,
                                isLiked: false,
                                bgColor: CustomColors.GOLD,
                              )),
                    ),
                    const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                    CustomUnity.banner(),
                    const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                      child: InkWell(
                        onTap: (){ Get.to( () => const FilterScreen(), arguments: "All" ); },
                        overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("New Added", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontFamily: "Pop_Bold", wordSpacing: 1)),
                            Text("View All", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: "Pop_Semi_Bold", color: greenColor(context), fontSize: 12.0)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                    controller.products.isEmpty ? const HomeCustomShimmerEffect() : SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount: 8,
                          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) =>
                              HomeCustomProduct(
                                  imgUri: 'https://images.pexels.com/photos/4275890/pexels-photo-4275890.jpeg?auto=compress&cs=tinysrgb&w=1200',
                                  title: "Jacket noir",
                                  description: "Une jacket avec bon état pouvez-vous contacter moi.",
                                  onClick: (id){ Get.to( () => const ProductScreen(), arguments: id); },
                                  isLiked: false,
                                  price: 200
                              )),
                    ),
                    const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                    CustomUnity.banner(),
                    const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                      child: InkWell(
                        onTap: (){ Get.to( () => const FilterScreen(), arguments: "All" ); },
                        overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Products", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontFamily: "Pop_Bold", wordSpacing: 1)),
                            Text("View All", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: "Pop_Semi_Bold", color: greenColor(context), fontSize: 12.0)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                    controller.products.isEmpty ? const HomeCustomShimmerEffect() : SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount: 8,
                          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) =>
                              HomeCustomProduct(
                                  imgUri: 'https://images.pexels.com/photos/4275890/pexels-photo-4275890.jpeg?auto=compress&cs=tinysrgb&w=1200',
                                  title: "Jacket noir",
                                  description: "Une jacket avec bon état pouvez-vous contacter moi.",
                                  onClick: (id){ Get.to( () => const ProductScreen(), arguments: id); },
                                  isLiked: false,
                                  price: 200
                              )),
                    ),
                    const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                    HomeCustomTextIconBtn(onPressed: (){ Get.to( () => const FilterScreen(), arguments: "All" ); }, bgColor: grayColor(context).withOpacity(0.2), text: "More Products", icon: Iconsax.arrow_right_41),
                    const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                    CustomUnity.banner(),
                    const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 3),
                  ],
                )
        ),
      ),
    );
  }
}