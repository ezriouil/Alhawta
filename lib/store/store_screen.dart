import 'package:alhawta/new_product/new_product_screen.dart';
import 'package:alhawta/product/product_screen.dart';
import 'package:alhawta/store/store_controller.dart';
import 'package:alhawta/store/widgets/store_custom_empty.dart';
import 'package:alhawta/store/widgets/store_custom_product.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class StoreScreen extends CustomState {
  const StoreScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final StoreController controller = Get.find<StoreController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Back", style: Theme.of(context).textTheme.titleLarge),
        centerTitle: false,
        titleSpacing: 0.0,
        leading: InkWell(
            overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
            onTap: (Get.isBottomSheetOpen ?? false) ? null : Get.back,
            child: const Icon(Iconsax.arrow_left_3)
        ),
      ),
      body: Obx(
            () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator(color: greenColor(context), backgroundColor: greenColor(context).withOpacity(0.2)))
            : controller.storeProducts.isEmpty
            ? const StoreCustomEmpty(title: "Empty", description: "No product found")
            : ListView.builder(
            itemCount: controller.storeProducts.length,
            padding: const EdgeInsets.only(
              right: CustomSizes.SPACE_BETWEEN_ITEMS,
              left: CustomSizes.SPACE_BETWEEN_ITEMS,
              bottom: CustomSizes.SPACE_BETWEEN_SECTIONS * 3,
            ),
            itemBuilder: (BuildContext context, int index) =>
                StoreCustomProduct(
                    imgUri: 'https://i.ytimg.com/vi/YsMObMEAE_Q/hqdefault.jpg?sqp=-oaymwE9CNACELwBSFryq4qpAy8IARUAAAAAGAElAADIQj0AgKJDeAHwAQH4Af4JgALQBYoCDAgAEAEYciBMKDQwDw==&rs=AOn4CLDxhoRTxvhGQTp3uKFUNfqCHMQyYw',
                    id: 'randomId',
                    title: "Jacket noir",
                    description: "Jacket noir black size 23 more data should you check out our website.",
                    onView: (id){ Get.to( () => const ProductScreen(), arguments: id ); },
                    onUpdate: (String id){ controller.onUpdateBottomSheet(productId: id, context: context); }
                )
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: greenColor(context),
        elevation: 8,
        onPressed: (){ Get.to( ()  => const NewProductScreen(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 800), curve: Curves.fastOutSlowIn); },
        icon: Icon(Iconsax.add, color: darkDarkLightLightColor(context), size: 20),
        label: Text("Insert New Product", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: darkDarkLightLightColor(context))),
      ),
    );
  }
}