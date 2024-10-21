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
import 'package:alhawta/new_product/new_product_controller.dart';
import 'package:alhawta/new_product/new_product_screen.dart';
import 'package:alhawta/on_boarding_screen.dart';
import 'package:alhawta/product/product_controller.dart';
import 'package:alhawta/product/product_screen.dart';
import 'package:alhawta/profile/profile_controller.dart';
import 'package:alhawta/profile/profile_screen.dart';
import 'package:alhawta/settings/settings_controller.dart';
import 'package:alhawta/settings/settings_screen.dart';
import 'package:alhawta/store/store_controller.dart';
import 'package:alhawta/store/store_screen.dart';
import 'package:alhawta/utils/ads/custom_unity.dart';
import 'package:alhawta/utils/remote/custom_app_write.dart';
import 'package:alhawta/utils/remote/custom_firebase.dart';
import 'package:alhawta/utils/theme/theme_app.dart';
import 'package:alhawta/wishlist/wishlist_controller.dart';
import 'package:alhawta/wishlist/wishlist_screen.dart';
import 'package:appwrite/appwrite.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'home/home_controller.dart';

void main() async {

  // - - - - - - - - - - - - - - - - - - INITIALISATION WIDGETS - - - - - - - - - - - - - - - - - -  //
  WidgetsFlutterBinding.ensureInitialized();

  // - - - - - - - - - - - - - - - - - - INITIALISATION ADS - - - - - - - - - - - - - - - - - -  //
  // CustomAdmob.setup();
  CustomUnity.setup();
  // CustomFacebook.setup();

  // - - - - - - - - - - - - - - - - - - INITIALISATION DATABASES - - - - - - - - - - - - - - - - - -  //
  CustomFirebase.setup(
    onCallBack: (){
      Get.put(FirebaseAuth.instance);
      Get.put(FirebaseStorage.instance);
    }
  );
  CustomAppWrite.setup(
    onCallBack: (Databases databases){
      Get.put(databases);
    }
  );

  // - - - - - - - - - - - - - - - - - - HIDE THE TOP STATUS BAR AND SYSTEM BOTTOM BAR - - - - - - - - - - - - - - - - - -  //
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // - - - - - - - - - - - - - - - - - - SHOW ADMOB APP OPEN - - - - - - - - - - - - - - - - - -  //
  /* CustomAdmob.appOpen(); */

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
          GetPage(name: '/productScreen', page: () => const ProductScreen()),
          GetPage(name: '/newProductScreen', page: () => const NewProductScreen()),
          GetPage(name: '/StoreScreen', page: () => const StoreScreen()),
        ],
        home: const OnBoardingScreen()
    );
  }
}

/* ------ INJECT DEPENDENCIES ------ */
class RootBinding implements Bindings {
  @override
  void dependencies() {
    /* <<< PUT >>> */
    Get.put(Connectivity());
    Get.put(IndexController());
    Get.put(HomeController());
    Get.put(CategoriesController());
    Get.put(WishListController());
    Get.put(SettingsController());

    /* <<< LAZY PUT >>> */
    Get.lazyPut( () => LoginController(), fenix: true);
    Get.lazyPut( () => RegisterController(), fenix: true);
    Get.lazyPut( () => ForgotPasswordController(), fenix: true);
    Get.lazyPut( () => FilterController(), fenix: true);
    Get.lazyPut( () => ProfileController(), fenix: true);
    Get.lazyPut( () => ProductController(), fenix: true);
    Get.lazyPut( () => NewProductController(), fenix: true);
    Get.lazyPut( () => StoreController(), fenix: true);
  }
}

//flutter pub run flutter_native_splash:remove
//flutter pub run flutter_native_splash:create --path=flutter_native_splash.yaml