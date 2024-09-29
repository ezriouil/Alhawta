import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';

class ProfileCustomTextField extends CustomState{
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final String? Function(String? value)? validator;
  final bool enabled;
  final Widget? trailing;


   const ProfileCustomTextField({super.key, required this.controller, required this.hint, required this.icon, required this.validator, this.keyboardType = TextInputType.text, required this.enabled, this.trailing});

  @override
  Widget execute(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      controller: controller,
      validator: validator,
      cursorColor: darkLightColor(context),
      cursorOpacityAnimates: true,
      decoration: InputDecoration(
          fillColor: grayColor(context).withOpacity(0.1),
          filled: true,
          hintText: hint,
          contentPadding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
          hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: darkLightColor(context), fontSize: 12.0, fontWeight: FontWeight.w300),
          prefixIcon: Icon(icon, color: grayColor(context), size: 18.0),
          suffixIcon: trailing,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: grayColor(context)))),
      minLines: 1,
      maxLines: 1,
      enabled: enabled,
      autocorrect: false,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}