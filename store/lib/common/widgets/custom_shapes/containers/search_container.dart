
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/utilis/constants/colors.dart';
import 'package:store/utilis/constants/sizes.dart';
import 'package:store/utilis/device/device_utility.dart';
import 'package:store/utilis/helpers/helper_functions.dart';


class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key, required this.text, this.icon, this.showBackground = true,  this.showBorder = true, this.onTap,
  });
  final String text;
  final IconData ?  icon;
  final bool showBackground,showBorder;
  final VoidCallback ? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Container(
          width: TDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(TSizes.md),
          decoration:BoxDecoration(
            color: showBackground ? dark ? TColors.dark : TColors.light : Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            border:  showBorder ? Border.all(color: TColors.grey) : null
          ),
          child:   Row(
            children: [
              const Icon(Iconsax.search_normal,color: TColors.darkerGrey,),
              const  SizedBox(width: TSizes.spaceBtwSections,),
               Text('Search in Store',style: Theme.of(context).textTheme.bodySmall,)
            ],
        
          ),
          ),
      ),
    );
  }
}
