import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late TextEditingController searchController;
  late RxBool showOrHideSearch;
  late RxList<String> products;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    showOrHideSearch = false.obs;
    products = RxList(["a", "b", "c", "d"]);
  }

  // - - - - - - - - - - - - - - - - - - Search - - - - - - - - - - - - - - - - - -  //
  onSearch(String? value){}

}