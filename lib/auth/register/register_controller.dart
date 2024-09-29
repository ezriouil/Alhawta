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
  void onChangeLanguage() async {
    try {
      Get.defaultDialog();
    }
    catch (_) {}
  }

}