import 'package:alhawta/auth/register/register_controller.dart';
import 'package:alhawta/auth/register/widgets/register_custom_elevated_btn.dart';
import 'package:alhawta/auth/register/widgets/register_custom_text_field.dart';
import 'package:alhawta/auth/register/widgets/register_custom_text_icon_btn.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_icons.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/extensions/validator.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class RegisterScreen extends CustomState {
  const RegisterScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final RegisterController controller = Get.find<RegisterController>();
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
        child: Form(
          key: controller.formState,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
              Text(
                  "Crée un compte",
                style: Theme.of(context).textTheme.headlineMedium!
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              Text("Complétez tous les champs pour vous s'inscrire.", style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: CustomSizes.SPACE_DEFAULT),

              RegisterCustomTextField(
                  controller: controller.fullNameController,
                  hint: "Full name",
                  icon: Iconsax.user,
                  validator: (value) => Validator.validateCustomField(value, "Full name obligé")
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
              RegisterCustomTextField(
                  controller: controller.emailController,
                  hint: "Email",
                  icon: Iconsax.direct_right,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => Validator.validateEmailField(value, "Email obligé", "n'oublié pas @")
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
              Obx(
                  () => RegisterCustomTextField(
                    controller: controller.passwordController,
                    hint: "Password",
                    icon: Iconsax.password_check,
                    obscureText: controller.passwordObscure.value,
                    trailing: InkWell(onTap: (){ controller.passwordObscure.value = !controller.passwordObscure.value; }, overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT), child: Icon(controller.passwordObscure.value ? Iconsax.eye : Iconsax.eye_slash, color: grayColor(context))),
                    validator: (value) => Validator.validatePasswordField(value, "Password obligé", "password court", "Doit contenir caractères / chiffres", "Trop long")
                ),
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
              Obx(
                  ()=> RegisterCustomTextField(
                    controller: controller.rePasswordController,
                    hint: "Password",
                    icon: Iconsax.password_check,
                    obscureText: controller.rePasswordObscure.value,
                    trailing: Obx(() => InkWell(onTap: (){ controller.rePasswordObscure.value = !controller.rePasswordObscure.value; }, overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT), child: Icon(controller.rePasswordObscure.value ? Iconsax.eye : Iconsax.eye_slash, color: grayColor(context)))),
                    validator: (value) => Validator.validatePasswordField(value, "Password obligé", "password court", "Doit contenir caractères / chiffres", "Trop long")
                ),
              ),

              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

              RegisterCustomElevatedBtn(
                onPressed: controller.onCreateAccount,
                text: "Login",
                bgColor: greenColor(context),
              ),

              const SizedBox(height: CustomSizes.SPACE_DEFAULT),

              Center(
                child: Column(
                  children: [

                    InkWell(
                      overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
                      onTap: Get.back,
                      child: Text.rich(
                        TextSpan(
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
                          text: "Already have account? ",
                          children: <TextSpan>[
                            TextSpan(
                              text: "Sign In",
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: greenColor(context),fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: darkLightColor(context),fontWeight: FontWeight.bold),
                        text: "By Signing up you agree to our\n",
                        children: <TextSpan>[
                          TextSpan(
                            text: "Terms Conditions",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: redColor(context),fontWeight: FontWeight.w400),
                            recognizer: TapGestureRecognizer()..onTap = (){},
                          ),
                          TextSpan(
                            text: " & ",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: darkLightColor(context),fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "Privacy Policy.",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: redColor(context),fontWeight: FontWeight.w400),
                            recognizer: TapGestureRecognizer()..onTap = (){},
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                    Row(
                      children: [
                        Expanded(child: Divider(color: grayColor(context), thickness: 0.3)),
                        Text("  Or  ", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: grayColor(context))),
                        Expanded(child: Divider(color: grayColor(context), thickness: 0.3)),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: CustomSizes.SPACE_DEFAULT),

              RegisterCustomTextIconBtn(
                onPressed: controller.onSingUpWithGoogle,
                text: "CONNECT WITH GOOGLE",
                bgColor: const Color(0xFF395998),
                icon: CustomIcons.GOOGLE,
              ),

              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

              RegisterCustomTextIconBtn(
                onPressed: controller.onChangeLanguage,
                text: "CHANGE THE LANGUAGE",
                bgColor: const Color(0xFF4285F4),
                icon: CustomIcons.TRADUCTION,
              ),

              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

            ],
          ),
        ),
      ),
    );
  }
}
