import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';

class NewProductCustomTextField extends CustomState{
  final TextEditingController controller;
  final String hint;
  final IconData? icon;
  final int? minMaxLines, maxLength;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;


   const NewProductCustomTextField({super.key, required this.controller, required this.hint, this.icon, required this.validator, this.minMaxLines, this.maxLength, this.keyboardType});

  @override
  Widget execute(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      validator: validator,
      cursorColor: darkLightColor(context),
      cursorOpacityAnimates: true,
      decoration: InputDecoration(
          fillColor: grayColor(context).withOpacity(0.1),
          filled: true,
          hintText: hint,
          counterStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: grayColor(context), fontSize: 10),
          contentPadding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
          hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: darkLightColor(context), fontSize: 12.0, fontWeight: FontWeight.w300),
          prefixIcon: icon != null ? Icon(icon, color: grayColor(context), size: 18.0) : null,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: grayColor(context)))),
      minLines: minMaxLines ?? 1,
      maxLines: minMaxLines ?? 1,
      maxLength: maxLength,
      keyboardType: keyboardType ?? TextInputType.text,
      autocorrect: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}