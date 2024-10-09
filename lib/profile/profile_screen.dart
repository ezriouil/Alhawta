import 'package:alhawta/profile/profile_controller.dart';
import 'package:alhawta/profile/widgets/profile_custom_elevated_btn.dart';
import 'package:alhawta/profile/widgets/profile_custom_text_field.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/extensions/validator.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ProfileScreen extends CustomState {
  const ProfileScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();
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
                onTap: () { controller.onEditMode(); },
                overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
                child: Obx( () => Icon(controller.editMode.isTrue ? Iconsax.close_circle : Iconsax.edit, size: controller.editMode.isTrue ? 22 : 20, color: darkLightColor(context)))),
            const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS)
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT),
          child: Obx(
              () => Form(
                key: controller.formKey,
                child: Column(
                children: [
                  const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                  // IMAGE
                  Container(
                    width: 130.0,
                    height: 130.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                        border: Border.all(color: grayColor(context), width: 2)
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 3),
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl:  "https://i.ytimg.com/vi/PbZl6LGcCZQ/hqdefault.jpg?sqp=-oaymwE9CNACELwBSFryq4qpAy8IARUAAAAAGAElAADIQj0AgKJDeAHwAQH4Af4JgALQBYoCDAgAEAEYZSBlKGUwDw==&rs=AOn4CLBno3KYDaH-Zn1TWV0FotWdkOp-Uw",
                              height: getHeight(context),
                              width: getWidth(context),
                              fit: BoxFit.cover,
                              progressIndicatorBuilder: (context, url, downloadProgress){
                                return Container(
                                    width: getWidth(context),
                                    height: getHeight(context),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: grayColor(context)),
                                        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2)
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 1, color: darkLightColor(context), backgroundColor: grayColor(context), value: downloadProgress.progress)),
                                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                                        Text(downloadProgress.progress != null ? "${(downloadProgress.progress! * 100).toStringAsFixed(2)} %" : "Loading", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 12.0, fontWeight: FontWeight.w300))
                                      ],
                                    )
                                );
                              },
                              errorWidget: (context, url, error) => Container(
                                  height: getHeight(context),
                                  width: getWidth(context),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: grayColor(context)),
                                      borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2)),
                                  child: Icon(Iconsax.gallery_remove, size: 30.0, color: grayColor(context))),
                            ),
                            if(controller.editMode.value) InkWell(
                              overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
                              onTap: (){ controller.onUpdateImageProfile(context); },
                              child: Container(
                                height: getHeight(context),
                                width: getWidth(context),
                                color: grayColor(context).withOpacity(0.4),
                                child: const Icon(Iconsax.edit, color: CustomColors.BLACK),
                              ),
                            ),
                          ],
                        )
                    ),
                  ),

                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                  // FULL NAME
                  ProfileCustomTextField(
                      controller: controller.fullNameController,
                      enabled: controller.editMode.value,
                      hint: "Full Name",
                      icon: Iconsax.user,
                      validator: (value) => Validator.validateCustomField(value, "Not be empty !!")),

                  const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                  // EMAIL
                  ProfileCustomTextField(
                      controller: controller.emailController,
                      hint: "Email",
                      enabled: false,
                      icon: Iconsax.direct_right,
                      keyboardType: TextInputType.emailAddress,
                      validator: null),

                  const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                  // WHATSAPP
                  IntlPhoneField(
                    controller: controller.whatsappController,
                    decoration: InputDecoration(
                        fillColor: grayColor(context).withOpacity(0.1),
                        filled: true,
                        hintText: "Whatsapp",
                        contentPadding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
                        hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: darkLightColor(context),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w300
                        ),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: grayColor(context)))),
                    initialCountryCode: 'MA',
                    cursorColor: darkLightColor(context),
                    languageCode: "fr",
                    enabled: controller.editMode.value,
                    pickerDialogStyle: PickerDialogStyle(
                        searchFieldCursorColor: greenColor(context),
                        searchFieldInputDecoration: InputDecoration(
                            fillColor: grayColor(context).withOpacity(0.1),
                            filled: true,
                            hintText: "Pick your country",
                            contentPadding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: grayColor(context)))),
                        countryCodeStyle: Theme.of(context).textTheme.bodyLarge,
                        countryNameStyle: Theme.of(context).textTheme.bodyLarge,
                        padding: const EdgeInsets.symmetric(
                            vertical: CustomSizes.SPACE_DEFAULT,
                            horizontal: CustomSizes.SPACE_BETWEEN_ITEMS)
                    ),
                    dropdownIcon: Icon(Iconsax.arrow_down_1, size: 18, color: grayColor(context)),
                    dropdownTextStyle: Theme.of(context).textTheme.bodyLarge,
                    invalidNumberMessage: "Error",
                    flagsButtonMargin: const EdgeInsets.only(top: 2, left: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                    onChanged: (phone) {},
                  ),

                  const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                  // DATE
                  ProfileCustomTextField(
                      controller: controller.createdAtController,
                      enabled: controller.editMode.value,
                      hint: "Date",
                      icon: Iconsax.timer_1,
                      validator: null
                  ),

                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                  AnimatedContainer(
                    curve: Curves.easeInOut,
                    alignment: Alignment.topCenter,
                    duration: const Duration(seconds: 1),
                    height: controller.editMode.isTrue ? CustomSizes.SPACE_DEFAULT * 2 : 0,
                    child: ProfileCustomElevatedBtn(onPressed: (){ controller.onUpdate(context); }, bgColor: greenColor(context), text: "Update"),
                  ),



                  const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                ],
                            ),
              ),
          ),
        )
    );
  }
}
