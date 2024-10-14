import 'package:alhawta/utils/state/custom_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/custom_sizes.dart';

class HomeCustomProduct extends CustomState {
  final String imgUri, title, description;
  final Function(String id) onClick;
  final int price;
  final bool isLiked;
  final Color? bgColor;

  const HomeCustomProduct(
      {super.key,
      required this.imgUri,
      required this.title,
      required this.description,
      required this.onClick,
      required this.price,
       required this.isLiked,
       this.bgColor,
      });

  @override
  Widget execute(BuildContext context) {

    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS / 8),
      padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        border: Border.all(color: grayColor(context), width: 0.5),
        gradient: LinearGradient(
          colors: [
            bgColor ?? greenColor(context),
            darkDarkLightLightColor(context),
            darkDarkLightLightColor(context)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: InkWell(
        onTap: () => { onClick("3") },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                    child: CachedNetworkImage(
                      imageUrl: imgUri,
                      height: 120,
                      width: getWidth(context),
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, downloadProgress){
                        return Container(
                            width: 120,
                            height: 140,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(color: grayColor(context)),
                                borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS)
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
                          width: 140,
                          decoration: BoxDecoration(
                              border: Border.all(color: grayColor(context)),
                              borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS)),
                          child: Icon(Iconsax.gallery_remove, size: 30.0, color: grayColor(context))),
                    )
                ),
                Container(
                    height: 24,
                    width: 24,
                    margin: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                    decoration: BoxDecoration(
                        color: grayColor(context).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS)),
                    child: Icon(isLiked ? Iconsax.heart5 : Iconsax.heart, size: 12, color: isLiked ? redColor(context) : darkLightColor(context))
                )
              ],
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS/ 2),
            Text(
              title,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: "Pop_Semi_Bold", fontSize: 12.0, wordSpacing: 0.5),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              description,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10.0, wordSpacing: 0.5),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$price DH",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: "Pop_Semi_Bold", fontSize: 14.0),
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: bgColor ?? greenColor(context),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          bottomRight: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2))),
                  child: Icon(Iconsax.add, color: darkDarkLightLightColor(context), size: 14.0),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
