import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/custom_sizes.dart';

class ProductCustomMoreProduct extends CustomState {
  final String imgUri, title, description;
  final Function(String id) onClick;
  final int price;
  final bool isLiked;
  final Color? bgColor;

  const ProductCustomMoreProduct(
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
      width: 140,
      margin: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
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
        onTap: () => { onClick("id:3") },
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
          // - - - - - - - - - - - - - - - - - - COLUMN - - - - - - - - - - - - - - - - - -  //
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      child: Image.network(
                        imgUri,
                        height: 120,
                        width: 140,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) =>
                        loadingProgress == null ? child : Container(
                            width: 140,
                            height: 120,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(color: grayColor(context)),
                                borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2)),
                            child: SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 4, color: greenColor(context)))
                        ),
                        errorBuilder: (context, url, error) => Container(
                            width: 140,
                            height: 120,
                            decoration: BoxDecoration(
                                border: Border.all(color: grayColor(context)),
                                borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2)),
                            child: Icon(Iconsax.gallery_remove, size: 30.0, color: grayColor(context))),
                      )),
                  Container(
                      height: 20,
                      width: 20,
                      margin: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      decoration: BoxDecoration(
                          color: grayColor(context).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS)),
                      child: Icon(isLiked ? Iconsax.heart5 : Iconsax.heart, size: 12, color: isLiked ? redColor(context) : darkLightColor(context))
                  )
                ],
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS/2),
              Text(
                title,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: "Pop_Semi_Bold", fontSize: 12.0),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                description,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10.0, fontWeight: FontWeight.normal, color: grayColor(context)),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$price DH",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: "Pop_Bold", fontSize: 14.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    padding: const EdgeInsets.all(4.0),
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
      ),
    );
  }
}
