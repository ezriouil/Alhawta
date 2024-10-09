import 'package:alhawta/auth/login/login_screen.dart';
import 'package:alhawta/utils/constants/custom_images.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends CustomState {
  const OnBoardingScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
                    bottomRight: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS)),
                child: Image.asset(CustomImages.WOMAN_DO_SHOPPING,
                    height: getHeight(context) * 0.7,
                    width: getWidth(context),
                    fit: BoxFit.cover
                )
            ),

            const SizedBox(height: CustomSizes.SPACE_DEFAULT),

            Text("Chose your clothes", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: "Pop_Semi_Bold")),

            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

            Text("Easily find your type of clothes from best brands\nenjoy, Have good shopping", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12, fontStyle: FontStyle.italic), textAlign: TextAlign.center),

            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

            Container(
              width: getWidth(context),
              height: CustomSizes.SPACE_DEFAULT * 2,
              padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS, vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                  backgroundColor: greenColor(context),
                  shadowColor: greenColor(context),
                  side: BorderSide.none,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2))),
                ),
                onPressed: (){ Get.off( () => const LoginScreen() ); },
                child: Text(
                  "Get started",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: darkDarkLightLightColor(context)),
                ),
              ),
            ),

            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

          ],
        ),
      ),
    );
  }
}
