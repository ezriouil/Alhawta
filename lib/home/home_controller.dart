import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late CarouselController pageController;
  late RxInt currentPageIndex;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    pageController = CarouselController();
    currentPageIndex = 0.obs;
  }

  // - - - - - - - - - - - - - - - - - - GET ALL PRODUCTS - - - - - - - - - - - - - - - - - -  //


  // - - - - - - - - - - - - - - - - - - CAROUSEL IMAGES - - - - - - - - - - - - - - - - - -  //
  final carouselImages = [
    "https://images.pexels.com/photos/1033729/pexels-photo-1033729.jpeg?auto=compress&cs=tinysrgb&w=1200"
  ];

}