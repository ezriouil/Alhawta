import 'package:alhawta/categories/categories_screen.dart';
import 'package:alhawta/home/home_screen.dart';
import 'package:alhawta/settings/settings_screen.dart';
import 'package:alhawta/wishlist/wishlist_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class IndexController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  static late RxInt currentIndex;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    currentIndex = 0.obs;
  }

  // - - - - - - - - - - - - - - - - - - UPDATE CURRENT INDEX - - - - - - - - - - - - - - - - - -  //
  dynamic onUpdateCurrentIndex(int? index){ currentIndex.value = index ?? 0; }

    // - - - - - - - - - - - - - - - - - - SCREENS - - - - - - - - - - - - - - - - - -  //
  List<Widget> screens() => [
    const HomeScreen(),
    const CategoriesScreen(),
    const WishListScreen(),
    const SettingsScreen()
  ];

}