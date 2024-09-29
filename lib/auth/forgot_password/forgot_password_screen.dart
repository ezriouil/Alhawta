import 'package:alhawta/auth/forgot_password/widgets/forgot_password_custom_elevated_btn.dart';
import 'package:alhawta/auth/forgot_password/widgets/forgot_password_custom_text_field.dart';
import 'package:alhawta/auth/register/register_screen.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_images.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/extensions/validator.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'forgot_password_controller.dart';

class ForgotPasswordScreen extends CustomState {
  const ForgotPasswordScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final ForgotPasswordController controller = Get.find<ForgotPasswordController>();
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
            children: [

              Image.asset(CustomImages.FOGOT_PASSWORD, height: 200, width: 200),

              Text(
                  "Forgot Password",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: "Pop_Semi_Bold")
              ),

              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

              Text("Please enter your email and we will send you a link\nto return your account.", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12), textAlign: TextAlign.center),

              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS *2),

              ForgotPasswordCustomTextField(
                  controller: controller.emailController,
                  hint: "Email",
                  icon: Iconsax.direct_right,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => Validator.validateEmailField(value, "Email obligé", "n'oublié pas @")
              ),

              const SizedBox(height: CustomSizes.SPACE_DEFAULT),

              ForgotPasswordCustomElevatedBtn(
                onPressed: controller.onSend,
                text: "Send",
                bgColor: greenColor(context),
              ),

              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

              InkWell(
                overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
                onTap: (){ Get.off( () => const RegisterScreen() ); },
                child: Text.rich(
                  TextSpan(
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),
                    text: "Don't have account? ",
                    children: <TextSpan>[
                      TextSpan(
                        text: "Register",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: greenColor(context),fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

            ],
          ),
        ),
      ),
    );
  }
}
