import 'package:flutter/material.dart';
import 'package:store/common/widgets/brands/brand_cart.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/utilis/constants/colors.dart';
import 'package:store/utilis/constants/image_strings.dart';
import 'package:store/utilis/constants/sizes.dart';
import 'package:store/utilis/helpers/helper_functions.dart';


class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: const EdgeInsets.all(TSizes.md),
      child: Column(
        children: [
          const TBrandCard(showBorder: false),
          const SizedBox(height: TSizes.spaceBtwItems,),
          Row(
            children: images.map((image) => brandTopProductImagesWidget(image,context)).toList()
          )
        ],
        
      ),
    );
  }
  Widget brandTopProductImagesWidget(String image,context) {
    return Expanded(
        child: TRoundedContainer(
                  height: 100,
                  backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkGrey : TColors.light,
                  margin: const EdgeInsets.only(right: TSizes.sm),
                  child:  Image(fit:BoxFit.contain ,image: AssetImage(image)),
                                             ),
               );
  }
}