import 'package:alhawta/product/widgets/product_custom_divider.dart';
import 'package:alhawta/product/widgets/product_custom_icon_btn.dart';
import 'package:alhawta/product/widgets/product_custom_info_tile.dart';
import 'package:alhawta/product/widgets/product_custom_more_product.dart';
import 'package:alhawta/product/widgets/product_custom_title_icon.dart';
import 'package:alhawta/utils/ads/custom_unity.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_images.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import 'product_controller.dart';

class ProductScreen extends CustomState {
  const ProductScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final ProductController controller = Get.find<ProductController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Back", style: Theme.of(context).textTheme.titleLarge),
        centerTitle: false,
        titleSpacing: 0.0,
        leading: InkWell(
            overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
            onTap: Get.back,
            child: const Icon(Iconsax.arrow_left_3)
        ),
        actions: [
          Obx(
                () => InkWell(
                    onTap: (){
                      controller.onUpsertToWishlist(); },
                    overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
                    child: Icon(controller.isInWishList.isTrue ? Iconsax.heart5 : Iconsax.heart, size: 22.0, color: controller.isInWishList.isTrue ? redColor(context) : darkLightColor(context))),
          ),
          const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
        ],
      ),
      body: context.isPortrait
          ? _portraitScreen(context: context, controller: controller)
          : _landscapeScreen(context: context, controller: controller),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 2, horizontal: CustomSizes.SPACE_DEFAULT),
        child: ProductCustomIconBtn(onPressed: (){ controller.onContact(context: context); }, bgColor: greenColor(context), text: "Contact", img: CustomImages.WHATSAPP),
      ),
    );
  }

  /// PORTRAIT SCREEN
  Widget _portraitScreen({ required BuildContext context, required ProductController controller }) => SingleChildScrollView(
    child: Column(
      children: [
        CarouselSlider.builder(
            carouselController: CarouselController(),
            options: CarouselOptions(
              height: getWidth(context) * 0.6,
              viewportFraction: 0.6,
              enlargeFactor: 0.2,
              enlargeCenterPage: true,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, _) { },
            ),
            itemCount: 1,
            itemBuilder: (BuildContext context, int index, int realIndex) =>
                ClipRRect(
                    borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                    child: Image.network(
                        "https://yourdesignstore.s3.amazonaws.com/uploads/yds/productImages/thumb/17119587213301Main-Product-Image.jpg",
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) => loadingProgress == null ? child : Center(child: CircularProgressIndicator(color: greenColor(context))),
                        errorBuilder: (context, url, error) => Center(child: Icon(Iconsax.gallery_remove, size: 40.0, color: grayColor(context))))
                )
        ),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                      () => ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 320,
                            minHeight: 90,
                            maxWidth: double.infinity,
                            maxHeight: 110,
                          ),
                          child: controller.admobIsNativeAdLoaded.isTrue
                              ? AdWidget(ad: controller.admobNativeAd)
                              : Center(child: Text("AD Loading", style: Theme.of(context).textTheme.bodyLarge)
                          )
                      )
              ),
              const SizedBox(height: CustomSizes.SPACE_DEFAULT),
              CustomUnity.banner(),
              const SizedBox(height: CustomSizes.SPACE_DEFAULT),
              const ProductCustomTitleIcon(title: "Info"),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              const ProductCustomDivider(),
              const ProductCustomInfoTile(title: "Title", info: "T-shirt noir"),
              const ProductCustomDivider(),
              const ProductCustomInfoTile(title: "Price", info: "30 DH"),
              const ProductCustomDivider(),
              const ProductCustomInfoTile(title: "Size", info: "Medium"),
              const ProductCustomDivider(),
              const ProductCustomInfoTile(title: "Location", info: "Casablanca"),
              const ProductCustomDivider(),
              const ProductCustomInfoTile(title: "Publié le", info: "03/10/2024"),
              const ProductCustomDivider(),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
              const ProductCustomTitleIcon(title: "Description"),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
              ReadMoreText(
                "Gentleman Givenchy dévoile la nouvelle Eau de Toilette Intense, une création aromatique florale boisée, la rencontre détonnante de la douceur et de la force. La bergamote, le basilic et la cardamome donnent à la fragrance un élan frais et épicé, rapidement amplifié par la sophistication et la tendresse de l'iris bleu.",
                trimMode: TrimMode.Line,
                trimExpandedText: " show less",
                trimCollapsedText: "read more",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal),
                moreStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: greenColor(context)),
                lessStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: greenColor(context)),
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
              Obx(
                    () => SizedBox(
                      height: 50.0,
                      width: getWidth(context),
                      child: controller.admobIsBannerAdLoaded.isTrue
                          ? AdWidget(ad: controller.admobBannerAd)
                          : Center(child: Text("AD Loading", style: Theme.of(context).textTheme.bodyLarge)
                      ),
                    ),
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
              const ProductCustomTitleIcon(title: "More Products"),
            ],
          )
        ),
        const SizedBox(height: CustomSizes.SPACE_DEFAULT),
        SizedBox(
          height: 210,
          child: ListView.builder(
              itemCount: 10,
              padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
                  ProductCustomMoreProduct(
                    imgUri: 'https://yourdesignstore.s3.amazonaws.com/uploads/yds/productImages/thumb/17119587213301Main-Product-Image.jpg',
                    title: "Jacket noir",
                    description: "Une jacket avec bon état pouvez-vous contacter moi.",
                    onClick: (id){ Get.off( () => const ProductScreen(), arguments: id); },
                    price: 200,
                    isLiked: false,
                  )),
        ),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
        Text(
          "Copyright © 2024 Alhawta. All rights reserved",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12, fontWeight: FontWeight.normal),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
      ],
    ),
  );

  /// LANDSCAPE SCREEN
  Widget _landscapeScreen({ required BuildContext context, required ProductController controller }) => Center(child: Text("Soon", style: Theme.of(context).textTheme.bodyLarge));

}