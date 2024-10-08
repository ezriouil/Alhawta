import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late TextEditingController searchController;
  late RxBool showOrHideSearch;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    showOrHideSearch = false.obs;
  }

  // - - - - - - - - - - - - - - - - - - Search - - - - - - - - - - - - - - - - - -  //
  onSearch(String? value){

  }

}