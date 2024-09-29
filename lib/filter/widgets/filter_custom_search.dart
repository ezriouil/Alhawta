import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FilterCustomSearch extends CustomState{
  final TextEditingController controller;
  final Function(String?) onChange;
  final GestureTapCallback onFilter, onBack;
  final String hint;


   const FilterCustomSearch({super.key, required this.controller, required this.hint, required this.onChange, required this.onFilter, required this.onBack});

  @override
  Widget execute(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Container(
              height: 52,
              decoration: BoxDecoration(color: grayColor(context).withOpacity(0.1), border: Border.all(color: grayColor(context)), borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4)),
              child: InkWell(
                onTap: onBack,
                overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
                child: Icon(Iconsax.arrow_left_24, color: grayColor(context), size: 20.0),
              ),
            )
        ),
        const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        Expanded(
          flex: 10,
          child: TextFormField(
            textInputAction: TextInputAction.next,
            controller: controller,
            cursorColor: darkLightColor(context),
            cursorOpacityAnimates: true,
            onChanged: onChange,
            decoration: InputDecoration(
                fillColor: grayColor(context).withOpacity(0.1),
                filled: true,
                hintText: hint,
                contentPadding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
                hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: darkLightColor(context), fontSize: 12.0, fontWeight: FontWeight.w300),
                prefixIcon: Icon(Iconsax.search_normal, color: grayColor(context), size: 18.0),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: grayColor(context)))),
            minLines: 1,
            maxLines: 1,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
        const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        Expanded(
          flex: 2,
          child: Container(
            height: 52,
            decoration: BoxDecoration(color: grayColor(context).withOpacity(0.1), border: Border.all(color: grayColor(context)), borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4)),
            child: InkWell(
              onTap: onFilter,
              overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
              child: Icon(Iconsax.filter, color: grayColor(context), size: 20.0),
            ),
          )
        ),
      ],
    );
  }
}