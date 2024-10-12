import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_images.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  final _imagePicker = ImagePicker();
  late List<CameraDescription> _cameras;
  late CameraController _controller;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    currentStep = 0.obs;
    thumbnailPath = "".obs;
    isImageLoading = false.obs;
    city = cities.first.obs;
    size = sizes.first.obs;
    category = categories.first.obs;
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    priceController = TextEditingController();
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  void init() async{
    _cameras = await availableCameras();
    _controller = CameraController(_cameras.first, ResolutionPreset.medium);
    await _controller.initialize();
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
    await showDialog(
        context: context,
        // barrierDismissible: false,
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
                  "By clicking on Delete button you will remove all the items on your wishList.",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 11),
                  textAlign: TextAlign.center,
                ),

                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: ()async{
                        // HANDEL PERMISSION
                        Get.back(); /* HIDE THE FIRST DIALOG */
                        try{

                          await showDialog(
                              context: context,
                              // barrierDismissible: false,
                              builder: (BuildContext innerContext) => AlertDialog(
                                contentPadding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
                                insetPadding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
                                backgroundColor: context.isDarkMode ? CustomColors.BLACK : CustomColors.WHITE,
                                elevation: 16,
                                content: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.width * 0.9,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
                                          child: CameraPreview(_controller)
                                      ),
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () async{
                                                XFile img = await _controller.takePicture();
                                                Get.back();
                                                isImageLoading.value = true;
                                                await Gal.putImage(img.path);
                                                await Future.delayed(const Duration(milliseconds: 1000));
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
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                          );

                        }
                        catch(_){}
                      },
                      overlayColor: MaterialStateProperty.all<Color?>(CustomColors.TRANSPARENT),
                      child: Container(
                        height: MediaQuery.of(context).size.width / 5 ,
                        width: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
                          border: Border.all(color: context.isDarkMode ? CustomColors.GREEN_LIGHT : CustomColors.GREEN_DARK, width: 0.6),
                          color: context.isDarkMode ? CustomColors.GREEN_LIGHT.withOpacity(0.2) : CustomColors.GREEN_DARK.withOpacity(0.2),
                        ),
                        child: Icon(
                            Iconsax.camera,
                            size: 28.0,
                            color: context.isDarkMode ? CustomColors.GREEN_LIGHT : CustomColors.GREEN_DARK
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: ()async{
                        // HANDEL PERMISSION
                        Get.back(); /* HIDE THE FIRST DIALOG */
                        try{
                          final img = await _imagePicker.pickImage(source: ImageSource.gallery);
                          if(img == null) return;
                          thumbnailPath.value = img.path;
                        }
                        catch(_){}
                      },
                      overlayColor: MaterialStateProperty.all<Color?>(CustomColors.TRANSPARENT),
                      child: Container(
                        height: MediaQuery.of(context).size.width / 5 ,
                        width: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
                          border: Border.all(color: context.isDarkMode ? CustomColors.GREEN_LIGHT : CustomColors.GREEN_DARK, width: 0.6),
                          color: context.isDarkMode ? CustomColors.GREEN_LIGHT.withOpacity(0.2) : CustomColors.GREEN_DARK.withOpacity(0.2),
                        ),
                        child: Icon(
                            Iconsax.gallery,
                            size: 28.0,
                            color: context.isDarkMode ? CustomColors.GREEN_LIGHT : CustomColors.GREEN_DARK
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
              ],
            ),
          ),
        )
    );
  }

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

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.paused) print("PAUSER");
    if(state == AppLifecycleState.resumed) print("RESUME");
    if(state == AppLifecycleState.detached) print("DITACHE");
    else print("NULL");
  }
}

class NewProductCategoryItem{
  final String title, imgUri;
  NewProductCategoryItem({ required this.title, required this.imgUri});
}