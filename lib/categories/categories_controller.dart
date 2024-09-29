import 'package:alhawta/utils/constants/custom_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late TextEditingController searchController;
  late RxBool showOrHideSearch;
  late RxList<CategoryEntity> filteredList;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    showOrHideSearch = false.obs;
    filteredList = categories().obs;
  }

  // - - - - - - - - - - - - - - - - - - Filter - - - - - - - - - - - - - - - - - -  //
  onFilter(String? value){
    List<CategoryEntity> filter = [];
    if (value!.isEmpty) { filter = categories(); }
    else {
      filter = categories().where((product) => product.title.toLowerCase().contains(value.toLowerCase())).toList();
    }
    filteredList.value = filter;
  }

  // - - - - - - - - - - - - - - - - - - LIST OF CATEGORIES - - - - - - - - - - - - - - - - - -  //
List<CategoryEntity> categories() => <CategoryEntity>[
  CategoryEntity(title: "All", imgUri: CustomImages.CATEGORY_ALL),
  CategoryEntity(title: "Baenie", imgUri: CustomImages.CATEGORY_BAENIE),
  CategoryEntity(title: "Blousse", imgUri: CustomImages.CATEGORY_BLOUSSE),
  CategoryEntity(title: "Bra", imgUri: CustomImages.CATEGORY_BRA),
  CategoryEntity(title: "Cap", imgUri: CustomImages.CATEGORY_CAP),
  CategoryEntity(title: "Coat", imgUri: CustomImages.CATEGORY_COAT),
  CategoryEntity(title: "Dress", imgUri: CustomImages.CATEGORY_DRESS),
  CategoryEntity(title: "Dress Gown", imgUri: CustomImages.CATEGORY_DRESS_GOWN),
  CategoryEntity(title: "Glasses", imgUri: CustomImages.CATEGORY_GLASSES),
  CategoryEntity(title: "Jacket", imgUri: CustomImages.CATEGORY_JACKET),
  CategoryEntity(title: "Jacket Suit", imgUri: CustomImages.CATEGORY_JACKET_SUIT),
  CategoryEntity(title: "Jean", imgUri: CustomImages.CATEGORY_JEAN),
  CategoryEntity(title: "Long Sleeve T-Shirt", imgUri: CustomImages.CATEGORY_LONG_SLEEVE_TSHIRT),
  CategoryEntity(title: "Pull Over", imgUri: CustomImages.CATEGORY_SANDALS),
  CategoryEntity(title: "Sandals", imgUri: CustomImages.CATEGORY_PULL_OVER),
  CategoryEntity(title: "Scarf", imgUri: CustomImages.CATEGORY_SCARF),
  CategoryEntity(title: "Shirt", imgUri: CustomImages.CATEGORY_SHIRT),
  CategoryEntity(title: "Skirt", imgUri: CustomImages.CATEGORY_SKIRT),
  CategoryEntity(title: "Sneaker", imgUri: CustomImages.CATEGORY_SNEAKER),
  CategoryEntity(title: "Socks", imgUri: CustomImages.CATEGORY_SOCKS),
  CategoryEntity(title: "Sport suit", imgUri: CustomImages.CATEGORY_SPORT_SUIT),
  CategoryEntity(title: "Talent", imgUri: CustomImages.CATEGORY_TALENT),
];

}

class CategoryEntity{
  final String title, imgUri;
  CategoryEntity({ required this.title, required this.imgUri});
}