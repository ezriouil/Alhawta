import 'package:alhawta/filter/filter_controller.dart';
import 'package:alhawta/filter/widgets/filter_custom_product.dart';
import 'package:alhawta/filter/widgets/filter_custom_search.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterScreen extends CustomState {
  const FilterScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final FilterController controller = Get.find<FilterController>();
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: CustomSizes.SPACE_DEFAULT),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            child: FilterCustomSearch(
              controller: controller.searchController,
              hint: "Search",
              onChange: controller.onSearch,
              onFilter: controller.onFilter,
              onBack: Get.back,
            ),
          ),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: context.isLandscape ? 5 : 2,
                    mainAxisExtent: 260,
                    mainAxisSpacing: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                    crossAxisSpacing: 2.0
                ),
                itemCount: 20,
                shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) =>
                      FilterCustomProduct(
                        imgUri: 'https://yourdesignstore.s3.amazonaws.com/uploads/yds/productImages/thumb/17119587213301Main-Product-Image.jpg',
                        title: "Jacket noir",
                        description: "Une jacket avec bon état pouvez-vous contacter moi.",
                        onClick: (id){},
                        onLike: (id){  },
                        price: 200,
                        isLiked: true,
                      )
            ),
          ),
        ],
      )
    );
  }
}
