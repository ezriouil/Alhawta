import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //


  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
  }

  // - - - - - - - - - - - - - - - - - - FAVORITE - - - - - - - - - - - - - - - - - -  //
  void onFavorite() async {}

  // - - - - - - - - - - - - - - - - - - SHARE - - - - - - - - - - - - - - - - - -  //
  void onShare() async {}

  // - - - - - - - - - - - - - - - - - -  CONTACT VIA WHATSAPP - - - - - - - - - - - - - - - - - -  //
  void onContact() async {
    const contact = "0624778355";
    const text = 'Hello this item is still ??';
    final whatAppApi = Uri.parse("https://wa.me/$contact?text=${Uri.parse(text)}");

    try {

      final canLaunch = await canLaunchUrl(whatAppApi);
      if(canLaunch) { await launchUrl(whatAppApi, mode: LaunchMode.externalApplication); }
      else { /* Show Dialog Msg */ }

    } catch(e) {
      /* Show Dialog Msg */
    }
  }

}