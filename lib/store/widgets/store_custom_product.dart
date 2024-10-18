import 'package:alhawta/store/data/product.dart';
import 'package:alhawta/store/widgets/store_custom_btn.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class StoreCustomProduct extends CustomState {
  final Product product;
  final void Function(String id) onView;
  final void Function(Product product) onUpdate;
  const StoreCustomProduct({super.key, required this.product, required this.onView, required this.onUpdate});

  @override
  Widget execute(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
      height: 120,
      width: getWidth(context),
      decoration: BoxDecoration(
        border: Border.all(color: grayColor(context).withOpacity(0.8)),
        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius:
              const BorderRadius.only(topLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2), bottomLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2)),
              child: CachedNetworkImage(
                imageUrl: product.thumbnail ?? "",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress){
                  return Container(
                      width: 110,
                      height: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: grayColor(context)),
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 1, color: darkLightColor(context), backgroundColor: grayColor(context), value: downloadProgress.progress)),
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                          Text(downloadProgress.progress != null ? "${(downloadProgress.progress! * 100).toStringAsFixed(2)} %" : "Loading", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 12.0, fontWeight: FontWeight.w300))
                        ],
                      )
                  );
                },
                errorWidget: (context, url, error) => Container(
                    height: 120,
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: grayColor(context)),
                        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2)),
                    child: Icon(Iconsax.gallery_remove, size: 30.0, color: grayColor(context))),
              )
          ),
          const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(product.title ?? "", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: "Pop_Semi_Bold", fontSize: 14, wordSpacing: 1, letterSpacing: 0), maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                  Text(product.description ?? "", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 11), maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      StoreCustomBtn(onPressed: (){ onUpdate(product); }, bgColor: blueColor(context), title: "Update"),
                      const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      StoreCustomBtn(onPressed: (){ onView(product.id ?? ""); }, bgColor: greenColor(context), title: "View")
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        ],
      ),
    );
  }
}
