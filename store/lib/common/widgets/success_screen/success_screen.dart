
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/styles/spacing_styles.dart';
import 'package:store/features/authentication/screens/login/login.dart';
import 'package:store/utilis/constants/image_strings.dart';
import 'package:store/utilis/constants/sizes.dart';
import 'package:store/utilis/constants/text_strings.dart';
import 'package:store/utilis/helpers/helper_functions.dart';



class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
             ///image
              Image(image: const AssetImage(TImages.staticSuccessIllustration),width: THelperFunctions.screenWidth()*0.6,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              ///title and subtitle
               
              Text(TTexts.yourAccountCreatedTitle, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Text(TTexts.yourAccountCreatedSubTitle, style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              ///button
               SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const LoginScreen());
                  },
                  child: const Text(TTexts.tContinue),
                ),
              ),

              
            ],
          ),
        ),
      ),
    );
  }
}