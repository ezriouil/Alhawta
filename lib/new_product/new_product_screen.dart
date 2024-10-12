import 'package:alhawta/new_product/widgets/new_product_custom_elevated_btn.dart';
import 'package:alhawta/new_product/widgets/new_product_custom_step_1.dart';
import 'package:alhawta/new_product/widgets/new_product_custom_step_2.dart';
import 'package:alhawta/new_product/widgets/new_product_custom_step_3.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'new_product_controller.dart';

class NewProductScreen extends CustomState {
  const NewProductScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final NewProductController controller = Get.find<NewProductController>();
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
          actions: [
            InkWell(
                onTap: (){ controller.onSubscription(context); },
                overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
                child: AvatarGlow(
                  glowColor: greenColor(context),
                  glowCount: 3,
                  glowRadiusFactor: 0.5,
                  child: Icon(
                    Icons.diamond,
                    color: darkLightColor(context),
                    size: 22,
                  ),
                )
            ),
            const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS)
          ],
        ),
        body: Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                  child: Stepper(
                      currentStep: controller.currentStep.value,
                      connectorColor: MaterialStateProperty.all<Color>(CustomColors.GREEN_DARK),
                      onStepTapped: (int? step){ controller.currentStep.value = step ?? 0; },
                      controlsBuilder: (BuildContext context, ControlsDetails details) => Row(
                          children: [
                            if(controller.currentStep.value > 0) Expanded(
                                    child: NewProductCustomElevatedBtn(
                                        onPressed: () { if(controller.currentStep.value != 0) controller.currentStep.value--; },
                                        bgColor: redColor(context),
                                        textColor: darkDarkLightLightColor(context),
                                        text: "Cancel")
                                ),
                            if(controller.currentStep.value > 0) const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS /2),
                            Expanded(child: NewProductCustomElevatedBtn(
                                    onPressed: (){
                                      if(controller.currentStep.value != 2) { controller.currentStep.value++; }
                                      else { debugPrint("SEND DATA TO THE SERVER"); }
                                      },
                                    bgColor: controller.currentStep.value != 2 ? grayColor(context) : greenColor(context),
                                    textColor: darkDarkLightLightColor(context),
                                    text: controller.currentStep.value == 2 ? "Submit" : "Continue"
                                )),
                          ]
                      ),
                      steps: [
                        Step(
                          title: const Text("Thumbnail"),
                          isActive: controller.currentStep.value >= 0,
                          state: controller.currentStep.value  > 0 ? StepState.complete : StepState.disabled,
                          content: NewProductCustomStep1(
                            imgPath: controller.thumbnailPath.value,
                            onPickImage: () { controller.onPickImage(context); },
                          )
                        ),
                        Step(
                          title: const Text("Information"),
                          isActive: controller.currentStep.value >= 1,
                          state: controller.currentStep.value  > 1 ? StepState.complete : StepState.disabled,
                          content: NewProductCustomStep2(
                            titleController: controller.titleController,
                            titleValidator: (String? value) => null,
                            descriptionController: controller.descriptionController,
                            descriptionValidator: (String? value) => null,
                          )),
                        Step(
                          title: const Text("Details"),
                          isActive: controller.currentStep.value >= 2,
                          state: controller.currentStep.value  > 2 ? StepState.complete : StepState.disabled,
                          content: NewProductCustomStep3(
                            cityValue: controller.city.value,
                            sizeValue: controller.size.value,
                            categoryValue: controller.category.value,
                            onChangeCity: (String? newCity){ controller.onCityChanged(newCity); },
                            onChangeSize: (String? newSize){ controller.onSizeChanged(newSize); },
                            onChangeCategory: (NewProductCategoryItem? newCategory){ controller.onCategoryChanged(newCategory); },
                            cites: controller.cities,
                            sizes: controller.sizes,
                            categories: controller.categories,
                          )
                        ),
                      ]
                  ),
                )
        )
    );
  }
}