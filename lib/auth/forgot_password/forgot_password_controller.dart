import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final TextEditingController emailController;
  late final GlobalKey<FormState> formState;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    formState = GlobalKey<FormState>();
  }

  // - - - - - - - - - - - - - - - - - - SEND LINK TO EMAIL USER - - - - - - - - - - - - - - - - - -  //
  Future<void> onSend() async {
    try {}
    catch (_) {}
  }

}