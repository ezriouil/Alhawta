import 'package:alhawta/new_product/widgets/new_product_custom_text_field.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NewProductCustomStep2 extends CustomState{
  final TextEditingController titleController, descriptionController;
  final String? Function(String? value)? titleValidator, descriptionValidator;

  const NewProductCustomStep2({super.key, required this.titleController, required this.titleValidator, required this.descriptionController, required this.descriptionValidator });

  @override
  Widget execute(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NewProductCustomTextField(
            controller: titleController,
            hint: "Title",
            icon: Iconsax.text,
            validator: titleValidator,
          maxLength: 30,
        ),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        NewProductCustomTextField(
            controller: descriptionController,
            hint: "Description",
            validator: descriptionValidator,
          minMaxLines: 3,
          maxLength: 90,
        ),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
      ],
    );
  }
}