import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late CarouselController pageController;
  late RxInt currentPageIndex;
  late RxList<String> products;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    pageController = CarouselController();
    currentPageIndex = 0.obs;
    products = RxList.empty();
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init(){ getAllProduct(); }

  // - - - - - - - - - - - - - - - - - - GET ALL PRODUCTS - - - - - - - - - - - - - - - - - -  //
  void getAllProduct()async{
    await Future.delayed(const Duration(milliseconds: 3000));
    products.value = productsTest;
  }

  // - - - - - - - - - - - - - - - - - - CAROUSEL IMAGES - - - - - - - - - - - - - - - - - -  //
  final carouselImages = [
    "https://images.pexels.com/photos/1033729/pexels-photo-1033729.jpeg?auto=compress&cs=tinysrgb&w=1200"
  ];

  // - - - - - - - - - - - - - - - - - - PRODUCTS TEST - - - - - - - - - - - - - - - - - -  //
  final productsTest = ["a", "b", "c", "d", "e", "f"];

}