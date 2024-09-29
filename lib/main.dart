import 'package:alhawta/auth/forgot_password/forgot_password_controller.dart';
import 'package:alhawta/auth/forgot_password/forgot_password_screen.dart';
import 'package:alhawta/auth/login/login_controller.dart';
import 'package:alhawta/auth/login/login_screen.dart';
import 'package:alhawta/auth/register/register_controller.dart';
import 'package:alhawta/auth/register/register_screen.dart';
import 'package:alhawta/categories/categories_controller.dart';
import 'package:alhawta/categories/categories_screen.dart';
import 'package:alhawta/filter/filter_controller.dart';
import 'package:alhawta/filter/filter_screen.dart';
import 'package:alhawta/home/home_screen.dart';
import 'package:alhawta/index/index_controller.dart';
import 'package:alhawta/index/index_screen.dart';
import 'package:alhawta/on_boarding_screen.dart';
import 'package:alhawta/profile/profile_controller.dart';
import 'package:alhawta/profile/profile_screen.dart';
import 'package:alhawta/settings/settings_controller.dart';
import 'package:alhawta/settings/settings_screen.dart';
import 'package:alhawta/utils/theme/theme_app.dart';
import 'package:alhawta/wishlist/wishList_controller.dart';
import 'package:alhawta/wishlist/wishList_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'home/home_controller.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // - - - - - - - - - - - - - - - - - - HIDE THE TOP STATUS BAR AND SYSTEM BOTTOM BAR - - - - - - - - - - - - - - - - - -  //
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const Alhawta());
}

class Alhawta extends StatelessWidget {
  const Alhawta ({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        themeMode: ThemeMode.system,
        theme: ThemeApp.lightTheme,
        darkTheme: ThemeApp.darkTheme,
        debugShowCheckedModeBanner: false,
        initialBinding: RootBinding(),
        getPages: [
          GetPage(name: '/on_boarding', page: () => const OnBoardingScreen()),
          GetPage(name: '/login', page: () => const LoginScreen()),
          GetPage(name: '/register', page: () => const RegisterScreen()),
          GetPage(name: '/forgot_password', page: () => const ForgotPasswordScreen()),
          GetPage(name: '/index', page: () => const IndexScreen()),
          GetPage(name: '/home', page: () => const HomeScreen()),
          GetPage(name: '/categories', page: () => const CategoriesScreen()),
          GetPage(name: '/search', page: () => const FilterScreen()),
          GetPage(name: '/wishList', page: () => const WishListScreen()),
          GetPage(name: '/settingsScreen', page: () => const SettingsScreen()),
          GetPage(name: '/profileScreen', page: () => const ProfileScreen()),
        ],
        home: const IndexScreen()
    );
  }
}


/* ------ INJECT DEPENDENCIES ------ */
class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(Connectivity());
    Get.put(LoginController());
    Get.put(RegisterController());
    Get.put(ForgotPasswordController());
    Get.put(IndexController());
    Get.put(HomeController());
    Get.put(CategoriesController());
    Get.put(FilterController());
    Get.put(WishListController());
    Get.put(SettingsController());
    Get.put(ProfileController());
  }
}

//flutter pub run flutter_native_splash:remove
//flutter pub run flutter_native_splash:create --path=flutter_native_splash.yaml