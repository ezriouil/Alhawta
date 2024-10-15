import 'package:alhawta/new_product/new_product_screen.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class StoreScreen extends CustomState {
  const StoreScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    //final StoreController storeController = Get.find<StoreController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Back", style: Theme.of(context).textTheme.titleLarge),
        centerTitle: false,
        titleSpacing: 0.0,
        leading: InkWell(
            overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
            onTap: Get.back,
            child: const Icon(Iconsax.arrow_left_3)
        ),
      ),
      body: const SizedBox(),
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
