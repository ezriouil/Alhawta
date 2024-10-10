import 'dart:io';

import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NewProductCustomStep1 extends CustomState{
  final String imgPath;
  final GestureTapCallback onPickImage;

   const NewProductCustomStep1({super.key, required this.imgPath, required this.onPickImage});

  @override
  Widget execute(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPickImage,
          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                  child: SizedBox(
                    width: getWidth(context) / 2,
                    height: getWidth(context) / 2,
                    child: imgPath == "" ?
                    Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            border: Border.all(color: darkLightColor(context))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.cloud_upload_outlined, size: 30.0, color: darkLightColor(context)),
                            Text("Upload Image", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.normal, fontSize: 12)),
                          ],
                        )) :
                    Image.file(
                        File(imgPath),
                        height: getHeight(context),
                        width: getWidth(context),
                        fit: BoxFit.cover,
                        errorBuilder: (context, url, error) =>
                            Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                    border: Border.all(color: darkLightColor(context))),
                                child: Icon(Iconsax.image, size: 30.0, color: grayColor(context)))
                    ),
                  ),
                ),
                if(imgPath != "") Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                        padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 3),
                        decoration: BoxDecoration(
                            color: darkDarkLightLightColor(context),
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2))),
                        child: Icon(
                          Iconsax.gallery_edit,
                          color: darkLightColor(context),
                          size: 20.0,
                        )
                    )
                ),
              ]
          ),
        ),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS)
      ],
    );
  }
}