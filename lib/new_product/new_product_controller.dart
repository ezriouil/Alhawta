import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NewProductController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late RxInt currentStep;
  late RxString thumbnailPath;
  late String size, location, category;
  late TextEditingController titleController, descriptionController, priceController;
  final _imagePicker = ImagePicker();

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    currentStep = 0.obs;
    thumbnailPath = "".obs;
    size = "";
    location = "";
    category = "";
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    priceController = TextEditingController();
  }

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



}