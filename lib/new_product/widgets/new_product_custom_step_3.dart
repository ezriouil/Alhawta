import 'package:alhawta/new_product/new_product_controller.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NewProductCustomStep3 extends CustomState{

  final String cityValue, sizeValue;
  final NewProductCategoryItem categoryValue;

  final void Function(String?) onChangeCity, onChangeSize;
  final void Function(NewProductCategoryItem?) onChangeCategory;

  final List<String> cites, sizes;
  final List<NewProductCategoryItem> categories;

  const NewProductCustomStep3({
    super.key,
    required this.cityValue,
    required this.sizeValue,
    required this.categoryValue,
    required this.onChangeCity,
    required this.onChangeSize,
    required this.onChangeCategory,
    required this.cites,
    required this.sizes,
    required this.categories,
  });

  @override
  Widget execute(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

        Text("Entrez votre ville", style: Theme.of(context).textTheme.bodyLarge?.copyWith(wordSpacing: 1, letterSpacing: 0.2, color: grayColor(context), fontWeight: FontWeight.normal)),

        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

        DropdownButton(
          value: cityValue,
          onChanged: (String? newCity){
            onChangeCity(newCity);
          },
          alignment: Alignment.bottomCenter,
          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
          selectedItemBuilder: (_) {
            return cites.map<Widget>(
                    (String city) => Container(
                      width: getWidth(context),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                      margin: const EdgeInsets.only(right: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          border: Border.all(color: grayColor(context)),
                          color: grayColor(context).withOpacity(0.1)
                      ),
                      child: Row(
                        children: [
                          Icon(Iconsax.building, size: 20, color: grayColor(context)),
                          const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          Text(cityValue, style: Theme.of(context).textTheme.bodyMedium),
                          const Spacer(),
                          Icon(Iconsax.arrow_down_1, size: 20, color: darkLightColor(context))
                        ],
                      ),
                    )
            ).toList();
          },
          iconSize: 0,
          underline: const Divider(color: CustomColors.TRANSPARENT),
          isExpanded: true,
          itemHeight: 50,
          items: cites.map((String city) => DropdownMenuItem(
              value: city,

              child: Text(city, style: Theme.of(context).textTheme.bodyLarge)
          )).toList(),
        ),

        const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

        Text("Entrez la taille", style: Theme.of(context).textTheme.bodyLarge?.copyWith(wordSpacing: 1, letterSpacing: 0.2, color: grayColor(context), fontWeight: FontWeight.normal)),

        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

        DropdownButton(
          value: sizeValue,
          alignment: Alignment.bottomCenter,
          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
          selectedItemBuilder: (_) {
            return sizes.map<Widget>(
                    (String size) => Container(
                  width: getWidth(context),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                  margin: const EdgeInsets.only(right: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      border: Border.all(color: grayColor(context)),
                      color: grayColor(context).withOpacity(0.1)
                  ),
                  child: Row(
                    children: [
                      Icon(Iconsax.size, size: 20, color: grayColor(context)),
                      const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      Text(sizeValue, style: Theme.of(context).textTheme.bodyMedium),
                      const Spacer(),
                      Icon(Iconsax.arrow_down_1, size: 20, color: darkLightColor(context))
                    ],
                  ),
                )
            ).toList();
          },
          iconSize: 0,
          underline: const Divider(color: CustomColors.TRANSPARENT),
          isExpanded: true,
          itemHeight: 50,
          items: sizes.map((String size) => DropdownMenuItem(
              value: size,
              child: Text(size, style: Theme.of(context).textTheme.bodyLarge)
          )).toList(),
          onChanged: onChangeSize,
        ),

        const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

        Text("Entrez Category", style: Theme.of(context).textTheme.bodyLarge?.copyWith(wordSpacing: 1, letterSpacing: 0.2, color: grayColor(context), fontWeight: FontWeight.normal)),

        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

        DropdownButton(
          value: categoryValue,
          alignment: Alignment.bottomCenter,
          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
          selectedItemBuilder: (_) {
            return categories.map<Widget>(
                    (NewProductCategoryItem size) => Container(
                      width: getWidth(context),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                      margin: const EdgeInsets.only(right: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          border: Border.all(color: grayColor(context)),
                          color: grayColor(context).withOpacity(0.1)
                      ),
                      child: Row(
                        children: [
                          Image.asset(categoryValue.imgUri, height: 20, width: 20, color: darkLightColor(context)),
                          const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          Text(categoryValue.title, style: Theme.of(context).textTheme.bodyLarge),
                          const Spacer(),
                          Icon(Iconsax.arrow_down_1, size: 20, color: darkLightColor(context))
                        ],
                      ),
                    )
            ).toList();
          },
          iconSize: 0,
          underline: const Divider(color: CustomColors.TRANSPARENT),
          isExpanded: true,
          itemHeight: 50,
          items: categories.map((NewProductCategoryItem category) => DropdownMenuItem(
                      value: category,
                      child: Row(
                        children: [
                          Image.asset(category.imgUri, height: 24, width: 24, color: darkLightColor(context)),
                          const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
                          Text(category.title, style: Theme.of(context).textTheme.bodyMedium)
                        ],
                      ),
                  )).toList(),
          onChanged: (NewProductCategoryItem? newCategory){onChangeCategory(newCategory);},
        ),

        const SizedBox(height: CustomSizes.SPACE_DEFAULT * 2)

      ],
    );
  }
}