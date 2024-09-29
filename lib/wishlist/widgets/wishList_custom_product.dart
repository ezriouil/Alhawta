import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:alhawta/wishlist/widgets/wishList_custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class WishListCustomProduct extends CustomState {
  final String src, title, description;
  final GestureTapCallback onView, onDelete;
  const WishListCustomProduct({super.key, required this.src, required this.title, required this.description, required this.onView, required this.onDelete});

  @override
  Widget execute(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
      height: 120,
      width: getWidth(context),
      decoration: BoxDecoration(
        border: Border.all(color: grayColor(context).withOpacity(0.6)),
        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius:
              const BorderRadius.only(topLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2), bottomLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2)),
              child: Image.network(
                  src,
                  height: 120,
                  width: 100,
                  fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) =>
                loadingProgress == null ? child : Container(
                    width: 100,
                    height: 120,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: grayColor(context)),
                        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2)),
                    child: SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 4, color: greenColor(context)))
                ),
                errorBuilder: (context, url, error) => Container(
                    width: 100,
                    height: 120,
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
                  Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: "Pop_Semi_Bold", fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                  Text(description, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 11), maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      WishListCustomBtn(onPressed: onDelete, bgColor: redColor(context), title: "Delete"),
                      const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      WishListCustomBtn(onPressed: onView, bgColor: greenColor(context), title: "View"),
                      const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
