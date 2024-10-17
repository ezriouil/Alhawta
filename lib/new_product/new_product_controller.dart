import 'package:alhawta/new_product/widgets/new_product_custom_elevated_btn.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_images.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class NewProductController extends GetxController with WidgetsBindingObserver {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late RxInt currentStep;
  late RxString thumbnailPath, size, city;
  late RxBool isImageLoading;
  late Rx<NewProductCategoryItem> category;
  late TextEditingController titleController, descriptionController, priceController;
  late GlobalKey<FormState> fromState;
  final _imagePicker = ImagePicker();
  late List<CameraDescription> _cameras;
  late CameraController _cameraController;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    currentStep = 0.obs;
    thumbnailPath = "".obs;
    isImageLoading = false.obs;
    city = cities.first.obs;
    size = sizes.first.obs;
    category = categories.first.obs;
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    priceController = TextEditingController();
    fromState = GlobalKey<FormState>();
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  void init() async{}

  // - - - - - - - - - - - - - - - - - - INIT CAMERA CONTROLLER - - - - - - - - - - - - - - - - - -  //
  Future<bool> _initCameraController() async {
    try{
      _cameras = await availableCameras();
      _cameraController = CameraController(_cameras.first, ResolutionPreset.medium);
      if(_cameraController.value.isInitialized) return true;
      await _cameraController.initialize();
      return true;
    }
    catch(e){ return false; }
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
    final bool isInitCameraController = await _initCameraController();
    RxBool flashMode = false.obs;
    await showDialog(
        context: context.mounted ? context : context,
        builder: (BuildContext innerContext) => AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                // - - - - - - - - - - - - - - - - - - ICON - - - - - - - - - - - - - - - - - -  //
                Container(
                  width: CustomSizes.SPACE_BETWEEN_SECTIONS * 2,
                  height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS),
                    color: context.isDarkMode ? CustomColors.GRAY_LIGHT.withOpacity(0.2) : CustomColors.GRAY_DARK.withOpacity(0.2),
                  ),
                  child: AvatarGlow(
                    glowCount: 3,
                    glowColor: context.isDarkMode ? CustomColors.GRAY_LIGHT.withOpacity(0.1) : CustomColors.GRAY_DARK.withOpacity(0.1),
                    glowRadiusFactor: 0.2,
                    child: Icon(
                        Iconsax.image,
                        size: CustomSizes.SPACE_BETWEEN_SECTIONS,
                        color: context.isDarkMode ? CustomColors.GRAY_LIGHT : CustomColors.GRAY_DARK
                    ),
                  ),
                ),

                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_DEFAULT * 2),

                // - - - - - - - - - - - - - - - - - -  TITLE - - - - - - - - - - - - - - - - - -  //
                Text(
                  "IMAGE",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(letterSpacing: 0.6, fontFamily: "Pop_Semi_Bold"),
                ),

                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                // - - - - - - - - - - - - - - - - - -  SUB TITLE 1 - - - - - - - - - - - - - - - - - -  //
                Text(
                  "You have multi chooses you can take image from the Camera or picking from your Gallery.",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 11),
                  textAlign: TextAlign.center,
                ),

                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),


                // - - - - - - - - - - - - - - - - - -  BUTTONS - - - - - - - - - - - - - - - - - -  //
                Row(
                  children: [
                    Expanded(
                      child: NewProductCustomElevatedBtn(
                          onPressed: ()async{
                            // CHECK PERMISSIONS

                            try{
                              Get.back(); /* HIDE THE FIRST DIALOG */
                              if(!isInitCameraController){
                                 /* SHOW MESSAGE CANNOT OPEN CAMERA */
                                return;
                              }
                              await showDialog(
                                  context: context.mounted ? context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext innerContext) => PopScope(
                                      canPop: false,
                                      child: AlertDialog(
                                        contentPadding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
                                        insetPadding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
                                        backgroundColor: context.isDarkMode ? CustomColors.BLACK : CustomColors.WHITE,
                                        elevation: 16,
                                        content: SizedBox(
                                          width: MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context).size.width,
                                          child: Stack(
                                            fit: StackFit.expand,
                                            children: [
                                              ClipRRect(
                                                  borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
                                                  child: CameraPreview(_cameraController)
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.bottomCenter,
                                                    padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
                                                    child: InkWell(
                                                      onTap: Get.back,
                                                      overlayColor: MaterialStateProperty.all<Color?>(CustomColors.TRANSPARENT),
                                                      child: Container(
                                                          alignment: Alignment.center,
                                                          decoration: BoxDecoration(
                                                              color: context.isDarkMode ? CustomColors.BLACK : CustomColors.WHITE,
                                                              borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS)
                                                          ),
                                                          height: 50,
                                                          width: 50,
                                                          child: Icon(Icons.close, size: 30, color: context.isDarkMode ? CustomColors.RED_LIGHT : CustomColors.RED_DARK)
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.bottomCenter,
                                                    padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
                                                    child: InkWell(
                                                      onTap: () async{
                                                        XFile img = await _cameraController.takePicture();
                                                        Get.back();
                                                        isImageLoading.value = true;
                                                        await Gal.putImage(img.path);
                                                        await Future.delayed(const Duration(milliseconds: 1500));
                                                        thumbnailPath.value = img.path;
                                                        isImageLoading.value = false;
                                                      },
                                                      overlayColor: MaterialStateProperty.all<Color?>(CustomColors.TRANSPARENT),
                                                      child: Container(
                                                          alignment: Alignment.center,
                                                          decoration: BoxDecoration(
                                                              color: context.isDarkMode ? CustomColors.BLACK : CustomColors.WHITE,
                                                              borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS)
                                                          ),
                                                          height: 70,
                                                          width: 70,
                                                          child: Icon(Icons.camera, size: 50, color: context.isDarkMode ? CustomColors.WHITE : CustomColors.BLACK)
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.bottomCenter,
                                                    padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
                                                    child: InkWell(
                                                      onTap: () async{
                                                        flashMode.value = !flashMode.value;
                                                        _cameraController.setFlashMode(flashMode.value ? FlashMode.always : FlashMode.off);
                                                      },
                                                      overlayColor: MaterialStateProperty.all<Color?>(CustomColors.TRANSPARENT),
                                                      child: Container(
                                                          alignment: Alignment.center,
                                                          decoration: BoxDecoration(
                                                              color: context.isDarkMode ? CustomColors.BLACK : CustomColors.WHITE,
                                                              borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS)
                                                          ),
                                                          height: 50,
                                                          width: 50,
                                                          child: Obx( () => Icon(flashMode.value ? Icons.flash_on: Icons.flash_off, size: 30, color: flashMode.value ? CustomColors.GOLD : context.isDarkMode ? CustomColors.WHITE : CustomColors.BLACK) )
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                  )
                              );
                            }
                            catch(_){}
                          },
                          bgColor: context.isDarkMode ? CustomColors.GRAY_LIGHT : CustomColors.GRAY_DARK,
                          textColor: context.isDarkMode ? CustomColors.BLACK : CustomColors.WHITE,
                          text: "Camera"
                      ),
                    ),
                    const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
                    Expanded(
                      child: NewProductCustomElevatedBtn(
                          onPressed: ()async{
                            // HANDEL PERMISSION
                            Get.back(); /* HIDE THE FIRST DIALOG */
                            try{
                              final img = await _imagePicker.pickImage(source: ImageSource.gallery);
                              if(img == null) return;
                              isImageLoading.value = true;
                              await Future.delayed(const Duration(milliseconds: 1500));
                              isImageLoading.value = false;
                              thumbnailPath.value = img.path;
                            }
                            catch(_){}
                          },
                          bgColor: context.isDarkMode ? CustomColors.GRAY_LIGHT : CustomColors.GRAY_DARK,
                          textColor: context.isDarkMode ? CustomColors.BLACK : CustomColors.WHITE,
                          text: "Gallery"
                      ),
                    ),
                  ],
                ),

                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
              ],
            ),
          ),
        )
    );
  }

  // - - - - - - - - - - - - - - - - - - CONTINUE BTN - - - - - - - - - - - - - - - - - -  //
  void onContinue() {
    if(currentStep.value == 0){
      if(thumbnailPath.value == "") return;
      currentStep.value++;
    }
    else if(currentStep.value == 1){
      if(fromState.currentState!.validate()) return;
      currentStep.value++;
    }
    else { onInsertNewProduct(); }
  }

  // - - - - - - - - - - - - - - - - - - CANCEL BTN - - - - - - - - - - - - - - - - - -  //
  void onCancel() { if (currentStep.value != 0) currentStep.value--; }

  // - - - - - - - - - - - - - - - - - - INSERT NEW PRODUCT TO DATABASE - - - - - - - - - - - - - - - - - -  //
  void onInsertNewProduct() {}

  // - - - - - - - - - - - - - - - - - - LIST OF CITIES - - - - - - - - - - - - - - - - - -  //
  final cities = [
    'Rabat',
    'Salé',
    'Knitra',
    'Agadir',
    'Casablanca',
  ];

  // - - - - - - - - - - - - - - - - - - LIST OF SIZES - - - - - - - - - - - - - - - - - -  //
  final sizes = [
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

  // - - - - - - - - - - - - - - - - - - OVERRIDE LIFECYCLE - - - - - - - - - - - - - - - - - -  //
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // if(state == AppLifecycleState.inactive){
    //   _cameraController.dispose();
    //   return;
    // }
    if(state == AppLifecycleState.resumed){
      _initCameraController();
      return;
    }

  }

}

class NewProductCategoryItem{
  final String title, imgUri;
  NewProductCategoryItem({ required this.title, required this.imgUri});
}