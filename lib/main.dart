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
import 'package:alhawta/product/product_controller.dart';
import 'package:alhawta/product/product_screen.dart';
import 'package:alhawta/profile/profile_controller.dart';
import 'package:alhawta/profile/profile_screen.dart';
import 'package:alhawta/settings/settings_controller.dart';
import 'package:alhawta/settings/settings_screen.dart';
import 'package:alhawta/utils/ads/custom_admob.dart';
import 'package:alhawta/utils/theme/theme_app.dart';
import 'package:alhawta/wishlist/wishList_controller.dart';
import 'package:alhawta/wishlist/wishList_screen.dart';
import 'package:applovin_max/applovin_max.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'home/home_controller.dart';

void main() async {

  // - - - - - - - - - - - - - - - - - - INITIALISATION - - - - - - - - - - - - - - - - - -  //
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  //MaxConfiguration? sdkConfiguration = await AppLovinMAX.initialize("h7FmU5xwBLUQ_qeEAXhZ0gLo3wb6a28SGswVr7fSaKsXn1flpoMbwLlkp74cBDHAZV04qlP3X9Jcy1hUgbsdv3");

  // - - - - - - - - - - - - - - - - - - HIDE THE TOP STATUS BAR AND SYSTEM BOTTOM BAR - - - - - - - - - - - - - - - - - -  //
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // - - - - - - - - - - - - - - - - - - SHOW ADMOB APP OPEN - - - - - - - - - - - - - - - - - -  //
  CustomAdmob.appOpen(
      onAdLoaded: (AppOpenAd ad){
        try{
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdFailedToShowFullScreenContent: (ad, error){ ad.dispose(); },
            onAdDismissedFullScreenContent: (ad){ ad.dispose(); },
          );
          ad.show();
        }catch(_){}
      },
      onAdFailedToLoad: (LoadAdError error){}
  );

  runApp(const Alhawta());
}

class Alhawta extends StatelessWidget {
  const Alhawta ({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(context.width, context.height),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
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
            GetPage(name: '/productScreen', page: () => const ProductScreen()),
          ],
          //home: const IndexScreen()
          home: const ProductScreen()
      ),
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
    Get.put(ProductController());
  }
}

//flutter pub run flutter_native_splash:remove
//flutter pub run flutter_native_splash:create --path=flutter_native_splash.yaml