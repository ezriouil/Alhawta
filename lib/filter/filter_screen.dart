import 'package:alhawta/filter/filter_controller.dart';
import 'package:alhawta/filter/widgets/filter_custom_empty.dart';
import 'package:alhawta/filter/widgets/filter_custom_product.dart';
import 'package:alhawta/filter/widgets/filter_custom_search.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FilterScreen extends CustomState {
  const FilterScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final FilterController controller = Get.find<FilterController>();
    return Scaffold(
        appBar: AppBar(
          title: Text("Back", style: Theme.of(context).textTheme.titleLarge),
          centerTitle: false,
          titleSpacing: 0.0,
          leading: InkWell(
              overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
              onTap: (){ Get.back(); },
              child: const Icon(Iconsax.arrow_left_3)
          ),
          actions: [
            InkWell(onTap: (){
              controller.showOrHideSearch.value = !controller.showOrHideSearch.value;
              controller.searchController.clear();
            }, overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT), child: const Icon(Iconsax.search_normal,size: 20,)),
            const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS)
          ],
        ),
        body: Obx(
            () => SingleChildScrollView(
              child: Column(
                children: [
                  AnimatedContainer(
                    curve: Curves.easeInOut,
                    alignment: Alignment.topCenter,
                    duration: const Duration(milliseconds: 800),
                    height: controller.showOrHideSearch.isTrue ? 60 : 0,
                    width: controller.showOrHideSearch.isTrue ? getWidth(context) : 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                      child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          opacity: controller.showOrHideSearch.value ? 1 : 0,
                          child: FilterCustomSearch(
                            controller: controller.searchController,
                            hint: "Search",
                            onChange: controller.onSearch,
                          )
                      ),
                    ),
                  ),
                  controller.products.isEmpty
                      ? FilterCustomEmpty(title: "Result Not Found", description: "Whoops ... ${controller.searchController.text} product not exist !.")
                      : GridView.builder(
                      padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: context.isTablet ? 4 : 2,
                          mainAxisExtent: 260,
                          mainAxisSpacing: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                          crossAxisSpacing: 2.0
                      ),
                      itemCount: controller.products.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) =>
                          FilterCustomProduct(
                            imgUri: 'https://images.pexels.com/photos/414144/pexels-photo-414144.jpeg?auto=compress&cs=tinysrgb&w=1200',
                            title: "Jacket noir",
                            description: "Une jacket avec bon état pouvez-vous contacter moi.",
                            onClick: (id){},
                            onLike: (id){},
                            price: 200,
                            isLiked: true,
                          )
                  ),
                ],
              ),
            )
        )
    );
  }
}
