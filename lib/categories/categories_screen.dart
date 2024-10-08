import 'package:alhawta/categories/widgets/categories_custom_category.dart';
import 'package:alhawta/categories/widgets/categories_custom_search.dart';
import 'package:alhawta/filter/filter_screen.dart';
import 'package:alhawta/index/index_controller.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'categories_controller.dart';

class CategoriesScreen extends CustomState {
  const CategoriesScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final CategoriesController controller = Get.find<CategoriesController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Back", style: Theme.of(context).textTheme.titleLarge),
        centerTitle: false,
        titleSpacing: 0.0,
        leading: InkWell(
            overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
            onTap: (){ IndexController.currentIndex.value = 0; },
            child: const Icon(Iconsax.arrow_left_3)
        ),
        actions: [
          InkWell(onTap: (){
            controller.showOrHideSearch.value = !controller.showOrHideSearch.value;
            controller.searchController.clear();
            controller.filteredList.value = controller.categories();
            }, overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT), child: const Icon(Iconsax.search_normal,size: 20,)),
          const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS)
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(
            ()=> Column(
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
                          child: CategoriesCustomSearch(
                              controller: controller.searchController,
                              hint: "Search",
                            onChange: controller.onFilter,
                          ),
                        ),
                      ),
                    ),
              controller.filteredList.isEmpty
                  ? const Text("No Item Found")
                  : GridView.builder(
                  itemCount: controller.filteredList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 90,
                      mainAxisSpacing:4.0,
                      crossAxisSpacing: 2.0),
                  itemBuilder: (BuildContext context, int index) =>
                      CategoriesCustomCategory(
                          title: controller.filteredList[index].title,
                          imgUri: controller.filteredList[index].imgUri,
                          onPressed: (title) { Get.to( () => const FilterScreen(), arguments: title ); }
                      )
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 3)
            ],
            ),
        ),
      )
    );
  }
}
