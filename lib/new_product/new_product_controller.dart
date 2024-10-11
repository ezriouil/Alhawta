import 'package:alhawta/utils/constants/custom_images.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NewProductController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late RxInt currentStep;
  late RxString thumbnailPath, size, city;
  late Rx<NewProductCategoryItem> category;
  late TextEditingController titleController, descriptionController, priceController;
  final _imagePicker = ImagePicker();

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    currentStep = 0.obs;
    thumbnailPath = "".obs;
    city = cites.first.obs;
    size = sizes.first.obs;
    category = categories.first.obs;
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    priceController = TextEditingController();
  }

  // - - - - - - - - - - - - - - - - - - ON CHANGE CITY - - - - - - - - - - - - - - - - - -  //
  void onCityChanged(String? newCity){ city.value = newCity!; }
  // - - - - - - - - - - - - - - - - - - ON CHANGE SIZE - - - - - - - - - - - - - - - - - -  //
  void onSizeChanged(String? newSize){ size.value = newSize!; }
  // - - - - - - - - - - - - - - - - - - ON CHANGE CATEGORY - - - - - - - - - - - - - - - - - -  //
  void onCategoryChanged(NewProductCategoryItem? newCategory){ category.value = newCategory!; }

  // - - - - - - - - - - - - - - - - - - SUBSCRIPTION - - - - - - - - - - - - - - - - - -  //
  void onSubscription(BuildContext context) {}

  // - - - - - - - - - - - - - - - - - - PICK IMAGE FROM GALLERY - - - - - - - - - - - - - - - - - -  //
  void onPickImage(BuildContext context) async{
    try{
      // PERMISSIONS

      final img = await _imagePicker.pickImage(source: ImageSource.gallery);
      if(img == null) return;
      thumbnailPath.value = img.path;

    }catch(_){}
  }

  // - - - - - - - - - - - - - - - - - - LIST OF CITIES - - - - - - - - - - - - - - - - - -  //
  final cites = [
    'Non',
    'Rabat',
    'Salé',
    'Knitra',
    'Agadir',
    'Casablanca',
  ];
  // - - - - - - - - - - - - - - - - - - LIST OF SIZES - - - - - - - - - - - - - - - - - -  //
  final sizes = [
    'Non',
    'Small',
    'Medium',
    'Large',
    'X-Large',
    'XX-Large',
    'XXX-Large',
    'XXXX-Large',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
  ];
  // - - - - - - - - - - - - - - - - - - LIST OF CATEGORIES - - - - - - - - - - - - - - - - - -  //
  final categories = <NewProductCategoryItem>[
    NewProductCategoryItem(title: "Non", imgUri: CustomImages.CATEGORY_ALL),
    NewProductCategoryItem(title: "All", imgUri: CustomImages.CATEGORY_ALL),
    NewProductCategoryItem(title: "Baenie", imgUri: CustomImages.CATEGORY_BAENIE),
    NewProductCategoryItem(title: "Blousse", imgUri: CustomImages.CATEGORY_BLOUSSE),
    NewProductCategoryItem(title: "Bra", imgUri: CustomImages.CATEGORY_BRA),
    NewProductCategoryItem(title: "Cap", imgUri: CustomImages.CATEGORY_CAP),
    NewProductCategoryItem(title: "Coat", imgUri: CustomImages.CATEGORY_COAT),
    NewProductCategoryItem(title: "Dress", imgUri: CustomImages.CATEGORY_DRESS),
    NewProductCategoryItem(title: "Dress Gown", imgUri: CustomImages.CATEGORY_DRESS_GOWN),
    NewProductCategoryItem(title: "Glasses", imgUri: CustomImages.CATEGORY_GLASSES),
    NewProductCategoryItem(title: "Jacket", imgUri: CustomImages.CATEGORY_JACKET),
    NewProductCategoryItem(title: "Jacket Suit", imgUri: CustomImages.CATEGORY_JACKET_SUIT),
    NewProductCategoryItem(title: "Jean", imgUri: CustomImages.CATEGORY_JEAN),
    NewProductCategoryItem(title: "Long Sleeve T-Shirt", imgUri: CustomImages.CATEGORY_LONG_SLEEVE_TSHIRT),
    NewProductCategoryItem(title: "Sandals", imgUri: CustomImages.CATEGORY_SANDALS),
    NewProductCategoryItem(title: "Pull Over", imgUri: CustomImages.CATEGORY_PULL_OVER),
    NewProductCategoryItem(title: "Scarf", imgUri: CustomImages.CATEGORY_SCARF),
    NewProductCategoryItem(title: "Shirt", imgUri: CustomImages.CATEGORY_SHIRT),
    NewProductCategoryItem(title: "Skirt", imgUri: CustomImages.CATEGORY_SKIRT),
    NewProductCategoryItem(title: "Sneaker", imgUri: CustomImages.CATEGORY_SNEAKER),
    NewProductCategoryItem(title: "Socks", imgUri: CustomImages.CATEGORY_SOCKS),
    NewProductCategoryItem(title: "Sport suit", imgUri: CustomImages.CATEGORY_SPORT_SUIT),
    NewProductCategoryItem(title: "Talent", imgUri: CustomImages.CATEGORY_TALENT),
  ];

}

class NewProductCategoryItem{
  final String title, imgUri;
  NewProductCategoryItem({ required this.title, required this.imgUri});
}