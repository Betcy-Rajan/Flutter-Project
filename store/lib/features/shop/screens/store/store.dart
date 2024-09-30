import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:store/common/widgets/appbar/appbar.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:store/common/widgets/images/t_circular_image.dart';
import 'package:store/common/widgets/layouts/grid_layout.dart';
import 'package:store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:store/common/widgets/texts/sections_heading.dart';
import 'package:store/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:store/utilis/constants/colors.dart';
import 'package:store/utilis/constants/enums.dart';
import 'package:store/utilis/constants/image_strings.dart';
import 'package:store/utilis/constants/sizes.dart';
import 'package:store/utilis/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Store',style: Theme.of(context).textTheme.headlineMedium!.apply(color:TColors.grey),),
        actions: [
          TCartCounterIcon(onPressed: (){}, iconColor: TColors.white,),
        ],
      ),
      body: NestedScrollView(headerSliverBuilder: (_,innerBoxScrolled) {
        return [SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          floating: true,
          backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
          expandedHeight: 440,


          flexibleSpace: Padding(
            padding:const  EdgeInsets.all(TSizes.defaultSpace),
            child: ListView (
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children:  [
                const SizedBox(height: TSizes.spaceBtwItems,),
                const TSearchContainer(text: 'Search in Store',showBorder: true,showBackground: false,padding: EdgeInsets.zero,),
                const SizedBox(height: TSizes.spaceBtwSections,),

                //Featured Brands
                TSectionHeading(title: 'Featured Brands',showActionButton: true, onPressed: () {},),
                const SizedBox(height: TSizes.spaceBtwItems/1.5,),

                 TGridLayout(itemCount: 4, mainAxisExtent: 80, itemBuilder: (_,index){
                  return  GestureDetector(
                    onTap: () {
                    },
                    child: TRoundedContainer(
                    padding: const EdgeInsets.all(TSizes.sm),
                    showBorder: true,
                    backgroundColor: Colors.transparent,
                    child: Row(
                      children: [
                        //Icon
                        Flexible(
                          child: TCircularImage(
                            isNetworkImage: false,
                            image: TImages.clothIcon,
                            backgroundColor: Colors.transparent,
                            overlayColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
                          ),
                        ),
                        const SizedBox(
                          width: TSizes.spaceBtwItems/2,
                        ),
                        ///Text
                         Expanded(
                           child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               const TBrandTitleWithVerifiedIcon(title: 'Nike',brandTextSizes: TextSizes.large,),
                               Text(
                                '256 Products',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.labelMedium,
                               )
                            ],
                            ),
                         )
                    
                      ],
                    ),
                                    ),
                  );
                 })

              ],
            )
            ),
        ),
        ];

      }, body: Container()),
   
    );
  }
}

