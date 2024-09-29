import 'package:alhawta/filter/widgets/filter_custom_filter_bottom_sheet.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late TextEditingController searchController;
  late RxString categorySelected;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    categorySelected = categories().first.title.obs;
  }

  // - - - - - - - - - - - - - - - - - - Search - - - - - - - - - - - - - - - - - -  //
  onSearch(String? value){

  }

  // - - - - - - - - - - - - - - - - - - Filter - - - - - - - - - - - - - - - - - -  //
  onFilter() {
    Get.bottomSheet(

      exitBottomSheetDuration: const Duration(milliseconds: 800),
      enterBottomSheetDuration: const Duration(milliseconds: 800),
        BottomSheet(
          backgroundColor: CustomColors.WHITE,

            onClosing: () {},
            builder: (BuildContext context) => Obx(
            ()=> FilterCustomFilterBottomSheet(
              categorySelected: categorySelected.value,
              categories: categories(),
              onCategoryChange: (value){ categorySelected.value = value; },
              onFilter: (){ Get.back(); },
              onClose: (){ Get.back(); },
          ),
        )
    ));
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