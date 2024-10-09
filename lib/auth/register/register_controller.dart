import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_images.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //

  late final TextEditingController fullNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController rePasswordController;
  late final GlobalKey<FormState> formState;
  late final RxBool passwordObscure, rePasswordObscure;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //

  @override
  void onInit() {
    super.onInit();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
    passwordObscure = true.obs;
    rePasswordObscure = true.obs;
    formState = GlobalKey<FormState>();
  }

  // - - - - - - - - - - - - - - - - - - CREATE ACCOUNT BY EMAIL AND PASSWORD - - - - - - - - - - - - - - - - - -  //
  Future<void> onCreateAccount() async {
    try {}
    catch (_) {}
  }

  // - - - - - - - - - - - - - - - - - - SING UP WITH GOOGLE - - - - - - - - - - - - - - - - - -  //
  void onSingUpWithGoogle() async {
    try {}
    catch (_) {}
  }

  // - - - - - - - - - - - - - - - - - - CHANGE APP LANGUAGE - - - - - - - - - - - - - - - - - -  //
  void onChangeLanguage({ required BuildContext context }) async{

    // CHECK CONNECTION INTERNET

    String langSelected = "";

    await showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            content: Column(
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
                            Checkbox(
                              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
                              value: false,
                              onChanged: (value) async{},
                            ),
                            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            ClipRRect(borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2), child: Image.asset(CustomImages.FLAG_MOROCCO, height: 30, width: 40, fit: BoxFit.cover))
                          ]
                      ),
                      Column(
                          children: [
                            Checkbox(
                              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
                              value: true,
                              onChanged: (value) async{},
                            ),
                            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            ClipRRect(borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2), child: Image.asset(CustomImages.FLAG_FRANCE, height: 30, width: 40, fit: BoxFit.cover))
                          ]
                      ),
                    ],
                  )
                ]
            )
        )
    );
    if(langSelected == "") return;
    // CALL LOCAL STORAGE
  }

}