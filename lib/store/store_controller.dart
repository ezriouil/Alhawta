import 'dart:io';

import 'package:alhawta/store/data/product.dart';
import 'package:alhawta/store/widgets/store_custom_elevated_btn.dart';
import 'package:alhawta/store/widgets/store_custom_text_field.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/extensions/validator.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class StoreController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late RxList<String> storeProducts;
  late RxBool isLoading;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() async{
    super.onInit();
    storeProducts = RxList.empty();
    isLoading = false.obs;
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init() async{
    isLoading.value = true;

    await Future.delayed(const Duration(milliseconds: 5000));
    storeProducts.value = ["A", "B", "C", "D"];
    isLoading.value = false;
  }

  // - - - - - - - - - - - - - - - - - - EDIT PRODUCT - - - - - - - - - - - - - - - - - -  //
  void onUpdateBottomSheet({required Product product, required BuildContext context}) {
    const Duration duration = Duration(milliseconds: 800);
    Get.bottomSheet(
        enableDrag: true,
        useRootNavigator: false,
        isScrollControlled: true,
        isDismissible: false,
        enterBottomSheetDuration: duration,
        exitBottomSheetDuration: duration,
        elevation: 0,
        barrierColor: CustomColors.BLACK.withOpacity(context.isDarkMode ? 0.8 : 0.6),
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: CustomColors.WHITE),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(CustomSizes.SPACE_DEFAULT),
                topRight: Radius.circular(CustomSizes.SPACE_DEFAULT)
            )
        ),
        backgroundColor: context.isDarkMode ? CustomColors.BLACK :  CustomColors.WHITE,
        _bottomSheetContent(product: product, context: context)
    );
  }

  /* BOTTOM SHEET CONTENT */
  Widget _bottomSheetContent({ required Product product, required BuildContext context }){

    final darkLightColor = context.isDarkMode ? CustomColors.WHITE : CustomColors.BLACK;
    final grayColor = context.isDarkMode ? CustomColors.GRAY_LIGHT : CustomColors.GRAY_DARK;
    final darkDarkLightLightColor = context.isDarkMode ? CustomColors.BLACK : CustomColors.WHITE;
    final greenColor = context.isDarkMode ? CustomColors.GREEN_LIGHT : CustomColors.GREEN_DARK;
    final getHeight = MediaQuery.of(context).size.height;
    final getWidth = MediaQuery.of(context).size.width;

    GlobalKey<FormState> formState = GlobalKey<FormState>();
    TextEditingController titleController = TextEditingController(text: product.title);
    TextEditingController descriptionController = TextEditingController(text: product.description);
    TextEditingController whatsappController = TextEditingController(text: product.phoneNumber);

    RxDouble height = 0.6.obs;
    RxString imgPath = "".obs;
    RxString city = (product.city ?? _cities.first).obs;
    RxString size = (product.size ?? _sizes.first).obs;
    RxString category = (product.category ?? _categories.first).obs;

    ImagePicker imagePicker = ImagePicker();

    return PopScope(
        canPop: false,
        child: Obx(
            () => AnimatedSize(
              curve: Curves.easeOutBack,
              alignment: Alignment.topLeft,
              duration: const Duration(milliseconds: 800),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * height.value,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT, vertical: CustomSizes.SPACE_BETWEEN_ITEMS),
                  child: Form(
                    key: formState,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                if(height.value == 0.9) {height.value = 0.6; }
                                else {height.value = 0.9; }
                              },
                              overlayColor: MaterialStateProperty.all<Color?>(CustomColors.TRANSPARENT),
                              child: AvatarGlow(glowColor: grayColor, child: Icon(height.value == 0.9 ? Iconsax.arrow_circle_down : Iconsax.arrow_circle_up, color: context.isDarkMode ? CustomColors.WHITE : CustomColors.BLACK, size: 26)),
                            ),
                            Text("Update", style: Theme.of(context).textTheme.titleLarge),
                            InkWell(
                              onTap: () {
                                _bottomSheetAlertDialog(
                                    context: context,
                                    icon: Iconsax.close_circle,
                                    iconColorLight: CustomColors.RED_LIGHT,
                                    iconColorDark: CustomColors.RED_DARK,
                                    title: 'Are You Sure',
                                    subTitle: 'By clicking on Exit button you will remove all your updates.',
                                    titleBtnConfirm: 'Exit',
                                    titleBtnCancel: 'Dismiss',
                                    titleBtnConfirmColor: context.isDarkMode ? CustomColors.RED_LIGHT : CustomColors.RED_DARK,
                                    onClickBtnConfirm: () async {
                                      Get.back(); /* CLOSE DIALOG */
                                      await Future.delayed(const Duration(milliseconds: 500)); /* HOLD HALF SECOND */
                                      Get.back(); /* CLOSE BOTTOM SHEET */
                                    },
                                    onClickBtnCancel: (){ Get.back(); /* CLOSE DIALOG */ }
                                );
                              },
                              overlayColor: MaterialStateProperty.all<Color?>(CustomColors.TRANSPARENT),
                              child: Icon(Iconsax.close_circle, color: context.isDarkMode ? CustomColors.WHITE : CustomColors.BLACK, size: 26),
                            )
                          ],
                        ),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                        Center(child: InkWell(
                          onTap: (){
                            _bottomSheetAlertDialog(
                                context: context,
                                icon: Iconsax.image,
                                iconColorLight: CustomColors.GREEN_LIGHT,
                                iconColorDark: CustomColors.GREEN_DARK,
                                title: 'Pick Image',
                                subTitle: 'By click on Gallery button automatically you will go to the images of your device.',
                                titleBtnConfirm: 'Gallery',
                                titleBtnCancel: 'Dismiss',
                                titleBtnConfirmColor: greenColor,
                                onClickBtnConfirm: () async {
                                  try{
                                    /* HANDEL PERMISSIONS */
                                    final img = await imagePicker.pickImage(source: ImageSource.gallery);
                                    if(img == null) return;
                                    Get.back(); /* CLOSE DIALOG */
                                    await Future.delayed(const Duration(milliseconds: 500)); /* HOLD HALF SECOND */
                                    imgPath.value = img.path;
                                  }
                                  catch(_){}
                                },
                                onClickBtnCancel: (){ Get.back(); /* CLOSE DIALOG */ }
                            );
                          },
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                  child: SizedBox(
                                      height: getWidth / 2,
                                      width: getWidth / 2,
                                      child: imgPath.value == ""
                                          ? CachedNetworkImage(
                                        imageUrl:  product.thumbnail ?? "",
                                        height: getHeight,
                                        width: getWidth,
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder: (context, url, downloadProgress) => Container(
                                            width: getWidth,
                                            height: getHeight,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: grayColor),
                                                borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2)
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 1, color: darkLightColor, backgroundColor: grayColor, value: downloadProgress.progress)),
                                                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                                                Text(downloadProgress.progress != null ? "${(downloadProgress.progress! * 100).toStringAsFixed(2)} %" : "Loading", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 12.0, fontWeight: FontWeight.w300))
                                              ],
                                            )
                                        ),
                                        errorWidget: (context, url, error) => Container(
                                            height: getHeight,
                                            width: getWidth,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: grayColor),
                                                borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2)),
                                            child: Icon(Iconsax.gallery_remove, size: 30.0, color: grayColor
                                            )
                                        ),
                                      )
                                          : Image.file(
                                          File(imgPath.value),
                                          height: getHeight,
                                          width: getWidth,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, url, error) => Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                                  border: Border.all(color: darkLightColor)),
                                              child: Icon(Iconsax.image, size: 30.0, color: grayColor)
                                          )
                                      )
                                  ),
                                ),
                                Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                        padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 3),
                                        decoration: BoxDecoration(
                                            color: darkDarkLightLightColor,
                                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2))),
                                        child: Icon(
                                          Iconsax.gallery_edit,
                                          color: darkLightColor,
                                          size: 20.0,
                                        )
                                    )
                                ),
                              ]
                          ),
                        )),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                        StoreCustomTextField(
                          controller: titleController,
                          hint: "Title",
                          icon: Iconsax.text,
                          validator: (value) => Validator.validateCustomField(value, "Title should not be empty"),
                          maxLength: 30,
                        ),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                        StoreCustomTextField(
                          controller: descriptionController,
                          hint: "Description",
                          validator: (value) => Validator.validateCustomField(value, "Description should not be empty"),
                          minMaxLines: 3,
                          maxLength: 90,
                        ),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                        Text("Entrez votre ville", style: Theme.of(context).textTheme.bodyLarge?.copyWith(wordSpacing: 1, letterSpacing: 0.2, color: grayColor, fontWeight: FontWeight.normal)),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                        DropdownButton(
                          value: city.value,
                          onChanged: (String? newCity){ city.value = newCity!; },
                          alignment: Alignment.bottomCenter,
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
                          selectedItemBuilder: (_) => _cities.map<Widget>(
                                  (String cityItem) => Container(
                                width: getWidth,
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                                margin: const EdgeInsets.only(right: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                    border: Border.all(color: grayColor),
                                    color: grayColor.withOpacity(0.1)
                                ),
                                child: Row(
                                  children: [
                                    Icon(Iconsax.building, size: 20.0, color: grayColor),
                                    const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                    Text(cityItem, style: Theme.of(context).textTheme.bodyMedium),
                                    const Spacer(),
                                    Icon(Iconsax.arrow_down_1, size: 20, color: darkLightColor)
                                  ],
                                ),
                              )
                          ).toList(),
                          iconSize: 0,
                          underline: const Divider(color: CustomColors.TRANSPARENT),
                          isExpanded: true,
                          itemHeight: 50.0,
                          items: _cities.map(
                                  (String cityItem) => DropdownMenuItem(
                                  value: cityItem,
                                  child: Text(cityItem, style: Theme.of(context).textTheme.bodyLarge)
                              )
                          ).toList(),
                        ),
                        const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                        Text("Entrez la taille", style: Theme.of(context).textTheme.bodyLarge?.copyWith(wordSpacing: 1, letterSpacing: 0.2, color: grayColor, fontWeight: FontWeight.normal)),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                        DropdownButton(
                          value: size.value,
                          onChanged: (String? newSize){ size.value = newSize!;},
                          alignment: Alignment.bottomCenter,
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
                          selectedItemBuilder: (_) {
                            return _sizes.map<Widget>(
                                    (String sizeItem) => Container(
                                  width: getWidth,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                                  margin: const EdgeInsets.only(right: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                      border: Border.all(color: grayColor),
                                      color: grayColor.withOpacity(0.1)
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Iconsax.size, size: 20, color: grayColor),
                                      const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                      Text(sizeItem, style: Theme.of(context).textTheme.bodyMedium),
                                      const Spacer(),
                                      Icon(Iconsax.arrow_down_1, size: 20, color: darkLightColor)
                                    ],
                                  ),
                                )
                            ).toList();
                          },
                          iconSize: 0,
                          underline: const Divider(color: CustomColors.TRANSPARENT),
                          isExpanded: true,
                          itemHeight: 50,
                          items: _sizes.map((String sizeItem) => DropdownMenuItem(
                              value: sizeItem,
                              child: Text(sizeItem, style: Theme.of(context).textTheme.bodyLarge)
                          )).toList(),
                        ),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                        Text("Entrez Category", style: Theme.of(context).textTheme.bodyLarge?.copyWith(wordSpacing: 1, letterSpacing: 0.2, color: grayColor, fontWeight: FontWeight.normal)),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                        DropdownButton(
                          value: category.value,
                          onChanged: (String? newCategory){ category.value = newCategory!;},
                          alignment: Alignment.bottomCenter,
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
                          selectedItemBuilder: (_) {
                            return _categories.map<Widget>(
                                    (String categoryItem) => Container(
                                  width: getWidth,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                                  margin: const EdgeInsets.only(right: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                      border: Border.all(color: grayColor),
                                      color: grayColor.withOpacity(0.1)
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Iconsax.category, size: 20, color: grayColor),
                                      const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                      Text(categoryItem, style: Theme.of(context).textTheme.bodyMedium),
                                      const Spacer(),
                                      Icon(Iconsax.arrow_down_1, size: 20, color: darkLightColor)
                                    ],
                                  ),
                                )
                            ).toList();
                          },
                          iconSize: 0,
                          underline: const Divider(color: CustomColors.TRANSPARENT),
                          isExpanded: true,
                          itemHeight: 50,
                          items: _categories.map((String categoryItem) => DropdownMenuItem(
                              value: categoryItem,
                              child: Text(categoryItem, style: Theme.of(context).textTheme.bodyLarge)
                          )).toList(),
                        ),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                        Text("Entrez Whatsapp", style: Theme.of(context).textTheme.bodyLarge?.copyWith(wordSpacing: 1, letterSpacing: 0.2, color: grayColor, fontWeight: FontWeight.normal)),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                        IntlPhoneField(
                          controller: whatsappController,
                          decoration: InputDecoration(
                              fillColor: grayColor.withOpacity(0.1),
                              filled: true,
                              hintText: "Whatsapp",
                              contentPadding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
                              hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: darkLightColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w300
                              ),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: grayColor))),
                          initialCountryCode: product.initialCountryCode ?? 'MA',
                          cursorColor: darkLightColor,
                          languageCode: "fr",
                          pickerDialogStyle: PickerDialogStyle(
                              searchFieldCursorColor: greenColor,
                              searchFieldInputDecoration: InputDecoration(
                                  fillColor: grayColor.withOpacity(0.1),
                                  filled: true,
                                  hintText: "Pick your country",
                                  contentPadding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: grayColor))),
                              countryCodeStyle: Theme.of(context).textTheme.bodyLarge,
                              countryNameStyle: Theme.of(context).textTheme.bodyLarge,
                              padding: const EdgeInsets.symmetric(
                                  vertical: CustomSizes.SPACE_DEFAULT,
                                  horizontal: CustomSizes.SPACE_BETWEEN_ITEMS
                              )
                          ),
                          dropdownIcon: Icon(Iconsax.arrow_down_1, size: 18, color: grayColor),
                          dropdownTextStyle: Theme.of(context).textTheme.bodyLarge,
                          invalidNumberMessage: "Invalid",
                          flagsButtonMargin: const EdgeInsets.only(top: 2, left: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                          onChanged: (phone) {},
                        ),
                        const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                        StoreCustomElevatedBtn(onPressed: (){}, bgColor: greenColor, text: "Validate"),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                      ],
                    )
                  )
                ),
              ),
            )
        )
    );
  }

  /* BOTTOM SHEET DIALOG */
  void _bottomSheetAlertDialog({
    required BuildContext context, required IconData icon,
    required String title, required String subTitle,
    required String titleBtnConfirm, required String titleBtnCancel,
    required Color titleBtnConfirmColor, Color? titleBtnCancelColor, required Color iconColorLight, required Color iconColorDark,
    required GestureTapCallback onClickBtnConfirm, required GestureTapCallback onClickBtnCancel
  }) async {

    await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext innerContext) => PopScope(
        canPop: false,
        child: AlertDialog(
          content: SizedBox(
            width: double.infinity,
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
                    color: context.isDarkMode ? iconColorLight.withOpacity(0.2) : iconColorDark.withOpacity(0.2),
                  ),
                  child: AvatarGlow(
                    glowCount: 3,
                    glowColor: context.isDarkMode ? iconColorLight.withOpacity(0.1) : iconColorDark.withOpacity(0.1),
                    glowRadiusFactor: 0.2,
                    child: Icon(
                        icon,
                        size: CustomSizes.SPACE_BETWEEN_SECTIONS,
                        color: context.isDarkMode ? iconColorLight : iconColorDark
                    ),
                  ),
                ),

                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_DEFAULT * 2),

                // - - - - - - - - - - - - - - - - - -  TITLE - - - - - - - - - - - - - - - - - -  //
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(letterSpacing: 0.6, fontFamily: "Pop_Semi_Bold"),
                ),

                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                // - - - - - - - - - - - - - - - - - -  SUB TITLE 1 - - - - - - - - - - - - - - - - - -  //
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 11),
                  textAlign: TextAlign.center,
                ),

                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                Row(
                  children: [
                    Expanded(
                      child: StoreCustomElevatedBtn(
                        onPressed: onClickBtnCancel.call,
                        text: titleBtnCancel,
                        textColor: context.isDarkMode ? CustomColors.BLACK : CustomColors.WHITE,
                        bgColor: titleBtnCancelColor ?? (context.isDarkMode ? CustomColors.GRAY_LIGHT : CustomColors.GRAY_DARK),
                      ),
                    ),
                    const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                    Expanded(
                      child: StoreCustomElevatedBtn(
                        onPressed: onClickBtnConfirm.call,
                        text: titleBtnConfirm,
                        bgColor: titleBtnConfirmColor,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              ],
            ),
          ),
        )
    ));
  }

  // - - - - - - - - - - - - - - - - - - LIST OF CITIES - - - - - - - - - - - - - - - - - -  //
  final _cities = <String>[
    'Rabat',
    'Salé',
    'Knitra',
    'Agadir',
    'Casablanca',
  ];

  // - - - - - - - - - - - - - - - - - - LIST OF SIZES - - - - - - - - - - - - - - - - - -  //
  final _sizes = [
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
  final List<String> _categories = [
    'Baenie',
    'Blousse',
    'Bra',
    'Cap',
    'Coat',
    'Dress',
    'Dress Gown',
    'Glasses',
    'Jacket',
    'Jacket Suit',
    'Jean',
    'Long Sleeve T-Shirt',
    'Sandals',
    'Pull Over',
    'Scarf',
    'Shirt',
    'Skirt',
    'Sneaker',
    'Socks',
    'Sport suit',
    'Talent',
  ];

}