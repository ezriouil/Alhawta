import 'package:alhawta/product/widgets/product_custom_icon_btn.dart';
import 'package:alhawta/product/widgets/product_custom_info_tile.dart';
import 'package:alhawta/product/widgets/product_custom_more_product.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_images.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        title: Text("Back", style: Theme.of(context).textTheme.titleMedium),
        centerTitle: false,
        leading: InkWell(
          onTap: Get.back,
          overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
          child: Icon(Iconsax.arrow_left_24, color: darkLightColor(context)),
        ),
        actions: [
          InkWell(
              onTap: () {},
              overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
              child: const Icon(Iconsax.heart, size: 22)),
          const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
          InkWell(
              onTap: () {},
              overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
              child: const Icon(Iconsax.share, size: 22)),
          const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
            Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                  child: Image.network(
                      "https://yourdesignstore.s3.amazonaws.com/uploads/yds/productImages/thumb/17119587213301Main-Product-Image.jpg",
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) => loadingProgress == null ? child : Center(child: CircularProgressIndicator(color: greenColor(context))),
                      errorBuilder: (context, url, error) => Center(child: Icon(Iconsax.gallery_remove, size: 40.0, color: grayColor(context))))
              ),
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductCustomInfoTile(title: "Title", info: "T-shirt noir"),
                  const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                  const ProductCustomInfoTile(title: "Price", info: "30 DH"),
                  const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                  const ProductCustomInfoTile(title: "Size", info: "Medium"),
                  const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                  const ProductCustomInfoTile(title: "Color", info: "Black"),
                  const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                  const ProductCustomInfoTile(title: "Location", info: "Casablanca"),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                  Text("Description", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: "Pop_Semi_Bold")),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                  ReadMoreText(
                    "Gentleman Givenchy dévoile la nouvelle Eau de Toilette Intense, une création aromatique florale boisée, la rencontre détonnante de la douceur et de la force. La bergamote, le basilic et la cardamome donnent à la fragrance un élan frais et épicé, rapidement amplifié par la sophistication et la tendresse de l'iris bleu.",
                    trimMode: TrimMode.Line,
                    trimExpandedText: "show less",
                    trimCollapsedText: "read more",
                    style: Theme.of(context).textTheme.bodySmall,
                    moreStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: greenColor(context)),
                    lessStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: greenColor(context)),
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                  Text("More Products", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: "Pop_Semi_Bold")),
                ],
              ),
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
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
                        onClick: (id){},
                        price: 200,
                        isLiked: false,
                      )),
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
            Text(
              "Copyright © 2024 Alhawta. All rights reserved",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: CustomSizes.SPACE_BETWEEN_ITEMS, horizontal: CustomSizes.SPACE_DEFAULT),
        child: ProductCustomIconBtn(onPressed: controller.onContact, bgColor: greenColor(context), text: "Contact", img: CustomImages.WHATSAPP),
      ),
    );
  }
}
