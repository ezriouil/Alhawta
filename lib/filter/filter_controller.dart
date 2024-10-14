import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late TextEditingController searchController;
  late RxBool showOrHideSearch, isLoading;
  late RxList<String> products;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    showOrHideSearch = false.obs;
    isLoading = false.obs;
    products = RxList.empty();
    //init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  void init() async{ getAllProducts(); }

  // - - - - - - - - - - - - - - - - - - SEARCH - - - - - - - - - - - - - - - - - -  //
  void getAllProducts() async{
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 1000));
    products.value = List.empty();
    //products.value = productsTest;
    isLoading.value = false;
  }

  // - - - - - - - - - - - - - - - - - - SEARCH - - - - - - - - - - - - - - - - - -  //
  void onSearch(String? value){}

  // - - - - - - - - - - - - - - - - - - TEST LIST - - - - - - - - - - - - - - - - - -  //
  final productsTest = ["a", "b", "c", "d"];

}