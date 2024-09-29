import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/custom_sizes.dart';

class FilterCustomProduct extends CustomState {
  final String imgUri, title, description;
  final Function(int id) onClick, onLike;
  final int price;
  final Color? bgColor;
  final bool isLiked;

  const FilterCustomProduct(
      {super.key,
      required this.imgUri,
      required this.title,
      required this.description,
      required this.onClick,
      required this.onLike,
      required this.price,
       required this.isLiked,
       this.bgColor,
      });

  @override
  Widget execute(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS / 8),
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
        onTap: () => { onClick(3) },
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS /4),
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
                        height: 170,
                        width: getWidth(context),
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) =>
                        loadingProgress == null ? child : Container(
                            width: getWidth(context),
                            height: 170,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(color: grayColor(context)),
                                borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2)),
                            child: SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 4, color: greenColor(context)))
                        ),
                        errorBuilder: (context, url, error) => Container(
                            width: getWidth(context),
                            height: 170,
                            decoration: BoxDecoration(
                                border: Border.all(color: grayColor(context)),
                                borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2)),
                            child: Icon(Iconsax.gallery_remove, size: 30.0, color: grayColor(context))),
                      )),
                  InkWell(
                    onTap: (){ onLike(3); },
                    overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
                    child: Container(
                      height: 28,
                      width: 28,
                      margin: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                      decoration: BoxDecoration(
                          color: grayColor(context).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS)),
                      child: Icon(isLiked ? Iconsax.heart5 : Iconsax.heart, size: 16, color: isLiked ? redColor(context) : darkLightColor(context))
                    ),
                  )
                ],
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS/2),
              Text(
                title,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: "Pop_Semi_Bold", fontSize: 12.0, letterSpacing: 1),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                description,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10.0),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
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
