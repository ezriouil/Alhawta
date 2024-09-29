import 'package:alhawta/index/index_screen.dart';
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
    try { Get.to( () => const IndexScreen() ); }
    catch (_) {}
  }

  // - - - - - - - - - - - - - - - - - - LOGIN WITH GOOGLE - - - - - - - - - - - - - - - - - -  //
  void onLoginWithGoogle() async {
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