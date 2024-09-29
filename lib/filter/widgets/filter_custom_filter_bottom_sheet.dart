import 'package:alhawta/filter/filter_controller.dart';
import 'package:alhawta/filter/widgets/filter_custom_elevated_btn.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterCustomFilterBottomSheet extends CustomState {
  final List<CategoryEntity> categories;
  final Function(String) onCategoryChange;
  final String? categorySelected;
  final GestureTapCallback onFilter, onClose;

  const FilterCustomFilterBottomSheet({
    super.key,
    required this.categorySelected,
    required this.categories,
    required this.onCategoryChange,
    required this.onFilter,
    required this.onClose,
  });

  @override
  Widget execute(BuildContext context) {
    return Container(
      width: getWidth(context),
      decoration: BoxDecoration(
        color: darkDarkLightLightColor(context),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(CustomSizes.SPACE_DEFAULT),
          topRight: Radius.circular(CustomSizes.SPACE_DEFAULT),
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
        child: Column(
          children: [
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
            Text("Filter by category", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: context.isLandscape ? 10 : 6,
                    mainAxisExtent: 60,
                    mainAxisSpacing:4.0,
                    crossAxisSpacing: 2.0
                ),
                itemCount: categories.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) =>
                  InkWell(
                    onTap: (){ onCategoryChange(categories[index].title); },
                    overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
                    child: Container(
                      padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      margin: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: grayColor(context).withOpacity(categories[index].title == categorySelected ? 0.8 : 0.2),
                        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS),
                      ),
                        child: Image.asset(categories[index].imgUri, color: darkLightColor(context), height: 30, width: 30),
                  ),
            )
                ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
            Row(
              children: [
                Expanded(child: FilterCustomElevatedBtn(onPressed: onClose, bgColor: redColor(context), text: "Close")),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
                Expanded(child: FilterCustomElevatedBtn(onPressed: onFilter, bgColor: greenColor(context), text: "Filter")),
              ],
            ),
            const SizedBox(height: CustomSizes.SPACE_DEFAULT)
          ],
        ),
      ));
  }
}
