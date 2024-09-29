import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';

class CategoriesCustomCategory extends CustomState{
  final String title, imgUri;
  final Function(String) onPressed;

   const  CategoriesCustomCategory({super.key, required this.title, required this.imgUri, required this.onPressed});

  @override
  Widget execute(BuildContext context) {
    return Container(
      height: 80.0,
      margin: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
      padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          border: Border.all(color: darkLightColor(context)),
        gradient: LinearGradient(
          colors: [
            greenColor(context).withOpacity(0.1),
            greenColor(context).withOpacity(0.2),
            greenColor(context).withOpacity(0.4)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: InkWell(
        overlayColor: MaterialStateProperty.all<Color>(CustomColors.TRANSPARENT),
        onTap: (){ onPressed(title); },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(imgUri, height: 40, fit: BoxFit.cover, color: darkLightColor(context),),
            Text(title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: darkLightColor(context),
                    fontFamily: "Pop_Semi_Bold",
                    fontSize: 12.0),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}