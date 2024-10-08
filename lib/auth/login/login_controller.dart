import 'package:alhawta/index/index_screen.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_images.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> formState;
  late final RxBool passwordObscure;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordObscure = true.obs;
    formState = GlobalKey<FormState>();
  }

  // - - - - - - - - - - - - - - - - - - LOGIN WITH  EMAIL AND PASSWORD - - - - - - - - - - - - - - - - - -  //
  Future<void> onLogin() async {
    try { Get.off( () => const IndexScreen() ); }
    catch (_) {}
  }

  // - - - - - - - - - - - - - - - - - - LOGIN WITH GOOGLE - - - - - - - - - - - - - - - - - -  //
  void onLoginWithGoogle() async {
    try {}
    catch (_) {}
  }

  // - - - - - - - - - - - - - - - - - - CHANGE APP LANGUAGE - - - - - - - - - - - - - - - - - -  //
  void onChangeLanguage({ required BuildContext context }) async{

    // CHECK CONNECTION INTERNET

    String langSelected = "";

    await showDialog(
        context: context,

        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Pick Your Prefer Language", style: Theme.of(context).textTheme.titleLarge, maxLines: 1, overflow: TextOverflow.ellipsis),
                  const Divider(color: CustomColors.GRAY_LIGHT),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                          children: [

                            // - - - - - - - - - - - - - - - - - - CHECKBOX - - - - - - - - - - - - - - - - - -  //
                            Checkbox(
                              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
                              value: false,
                              onChanged: (value) async{},
                            ),

                            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            // - - - - - - - - - - - - - - - - - - IMAGE - - - - - - - - - - - - - - - - - -  //
                            ClipRRect(borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2), child: Image.asset(CustomImages.FLAG_MOROCCO, height: 30, width: 40, fit: BoxFit.cover)),

                          ]
                      ),
                      Column(
                          children: [

                            // - - - - - - - - - - - - - - - - - - CHECKBOX - - - - - - - - - - - - - - - - - -  //
                            Checkbox(
                              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
                              value: true,
                              onChanged: (value) async{},
                            ),

                            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                            // - - - - - - - - - - - - - - - - - - IMAGE - - - - - - - - - - - - - - - - - -  //
                            ClipRRect(borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2), child: Image.asset(CustomImages.FLAG_FRANCE, height: 30, width: 40, fit: BoxFit.cover)),

                          ]
                      ),
                    ],
                  )
              ])
            )
          );
        });
    if(langSelected == "") return;
  }

}