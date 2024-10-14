import 'package:alhawta/auth/forgot_password/forgot_password_screen.dart';
import 'package:alhawta/auth/login/widgets/login_custom_elevated_btn.dart';
import 'package:alhawta/auth/login/widgets/login_custom_text_field.dart';
import 'package:alhawta/auth/login/widgets/login_custom_text_icon_btn.dart';
import 'package:alhawta/auth/register/register_screen.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_icons.dart';
import 'package:alhawta/utils/constants/custom_images.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/extensions/validator.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'login_controller.dart';

class LoginScreen extends CustomState {
  const LoginScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final LoginController controller = Get.find<LoginController>();
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
        child: Form(
          key: controller.formState,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

              Image.asset(CustomImages.SHOPPING, height: 150, width: 150, fit: BoxFit.cover),

              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

              Text(
                  "Welcome back,",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: "Pop_Semi_Bold")
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              Text("Please login to access to your account.", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: CustomSizes.SPACE_DEFAULT),

              LoginCustomTextField(
                  controller: controller.emailController,
                  hint: "Email",
                  icon: Iconsax.direct_right,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => Validator.validateEmailField(value, "Email obligé", "n'oublié pas @")
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
              Obx(
                  () => LoginCustomTextField(
                    controller: controller.passwordController,
                    hint: "Password",
                    icon: Iconsax.password_check,
                    obscureText: controller.passwordObscure.value,
                    trailing: InkWell(onTap: (){ controller.passwordObscure.value = !controller.passwordObscure.value; }, overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT), child: Icon(controller.passwordObscure.value ? Iconsax.eye : Iconsax.eye_slash, color: grayColor(context))),
                    validator: (value) => Validator.validatePasswordField(value, "Password obligé", "password court", "Doit contenir caractères / chiffres", "Trop long")
                ),
              ),

              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS/ 2),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () { Get.to( () => const ForgotPasswordScreen(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 800), curve: Curves.fastOutSlowIn); },
                      overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
                      child: Text("Forgot password ?", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12.0))),
                ],
              ),

              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

              LoginCustomElevatedBtn(
                onPressed: controller.onLogin,
                text: "Login",
                bgColor: greenColor(context),
              ),

              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

              LoginCustomElevatedBtn(
                onPressed: (){ Get.to( () => const RegisterScreen(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 800), curve: Curves.fastOutSlowIn); },
                text: "Crée un compte gratuitement",
                bgColor: grayColor(context),
              ),

              const SizedBox(height: CustomSizes.SPACE_DEFAULT),

              Row(
                children: [
                  Expanded(child: Divider(color: grayColor(context), thickness: 0.3)),
                  Text("  Or  ", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: grayColor(context))),
                  Expanded(child: Divider(color: grayColor(context), thickness: 0.3)),
                ],
              ),

              const SizedBox(height: CustomSizes.SPACE_DEFAULT),

              LoginCustomTextIconBtn(
                onPressed: controller.onLoginWithGoogle,
                text: "CONNECT WITH GOOGLE",
                bgColor: const Color(0xFF395998),
                icon: CustomIcons.GOOGLE,
              ),

              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

              LoginCustomTextIconBtn(
                onPressed: (){ controller.onChangeLanguage(context: context); },
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
