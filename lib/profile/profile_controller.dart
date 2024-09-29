import 'package:alhawta/profile/widgets/profile_custom_elevated_btn.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late GlobalKey<FormState> formKey;
  late TextEditingController fullNameController, emailController, whatsappController, createdAtController;
  late RxBool editMode;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    whatsappController = TextEditingController();
    createdAtController = TextEditingController();
    editMode = false.obs;
  }

  // - - - - - - - - - - - - - - - - - - ENABLE EDIT MODE - - - - - - - - - - - - - - - - - -  //
  void onEditMode(){ editMode.value = !editMode.value; }

  // - - - - - - - - - - - - - - - - - - BUTTON UPDATE - - - - - - - - - - - - - - - - - -  //
  void onUpdate(BuildContext context) async{
    await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext innerContext) => AlertDialog(
      content: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

            // - - - - - - - - - - - - - - - - - -  TITLE - - - - - - - - - - - - - - - - - -  //
            Text(
              "Update my information",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(letterSpacing: 0.6, fontFamily: "Pop_Semi_Bold"),
            ),

            // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

            // - - - - - - - - - - - - - - - - - -  SUB TITLE 1 - - - - - - - - - - - - - - - - - -  //
            Text(
                "By clicking on Update button you will update your info.",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12)
            ),

            // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
            Row(
              children: [
                Expanded(
                  child: ProfileCustomElevatedBtn(
                    onPressed: (){ Get.back(); },
                    text: "Dismiss",
                    bgColor: CustomColors.GRAY_LIGHT,
                    textColor: CustomColors.BLACK,
                  ),
                ),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                Expanded(
                  child: ProfileCustomElevatedBtn(
                    onPressed: (){
                      onEditMode();
                      Get.back();
                      },
                    text: "Update",
                    bgColor: CustomColors.GREEN_DARK,
                    textColor: CustomColors.WHITE,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    )
    );
  }

  // - - - - - - - - - - - - - - - - - - UPDATE IMAGE PROFILE- - - - - - - - - - - - - - - - - -  //
  void onUpdateImageProfile(BuildContext context) async{
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext innerContext) => AlertDialog(
          content: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                // - - - - - - - - - - - - - - - - - -  TITLE - - - - - - - - - - - - - - - - - -  //
                Text(
                  "Update image profile",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(letterSpacing: 0.6, fontFamily: "Pop_Semi_Bold"),
                ),

                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                // - - - - - - - - - - - - - - - - - -  SUB TITLE 1 - - - - - - - - - - - - - - - - - -  //
                Text(
                    "By clicking on Gallery button you will going into your photos to chose.",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12)
                ),

                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                Row(
                  children: [
                    Expanded(
                      child: ProfileCustomElevatedBtn(
                        onPressed: (){ Get.back(); },
                        text: "Dismiss",
                        bgColor: CustomColors.GRAY_LIGHT,
                        textColor: CustomColors.BLACK,
                      ),
                    ),
                    const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                    Expanded(
                      child: ProfileCustomElevatedBtn(
                        onPressed: (){
                          Get.back();
                        },
                        text: "Gallery",
                        bgColor: CustomColors.GOLD,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }

}