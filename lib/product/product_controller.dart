import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //


  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();

  }

  // - - - - - - - - - - - - - - - - - -  CONTACT VIA WHATSAPP - - - - - - - - - - - - - - - - - -  //
  void onContact() async{
    const contact = "+880123232333";
    const textMessage = "Hi, I need some help";
    const androidUrl = "whatsapp://send?phone=$contact&text=$textMessage";
    final iosUrl = "https://wa.me/$contact?text=${Uri.parse(textMessage)}";

    try{
      if(Platform.isIOS){ await launchUrl(Uri.parse(iosUrl)); }
      else{
        //await launchUrl(Uri.parse(androidUrl));
        await launchUrl(Uri.parse("www.google.com"));
      }
    } catch(e){
      print(e.toString());
    }
  }
}