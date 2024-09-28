import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


import 'package:store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:store/common/widgets/custom_shapes/containers/search_container.dart';

import 'package:store/common/widgets/texts/sections_heading.dart';

import 'package:store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:store/features/shop/screens/home/widgets/home_categories.dart';



import 'package:store/utilis/constants/sizes.dart';





class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(

              child:  Column(
                children: [
                  THomeAppBar(),
                   SizedBox(height: TSizes.spaceBtwSections,),
                  TSearchContainer(
                    text: 'Search in Store',
                    icon: Iconsax.search_normal,
                  ),
                  SizedBox(height: TSizes.spaceBtwSections,),
                  Padding(padding: 
                  EdgeInsets.only(left: TSizes.defaultSpace,),
                  child: Column(
                    children: [
                      TSectionHeading(
                        title: 'Popular Categories',
                        showActionButton: false,
                        textColor: Colors.white,
                      ),
                      SizedBox(height: TSizes.spaceBtwItems,),

                      //categories
                      THomeCategories(),
                    
                    ],
                  ),

                  ),

                ],
              ),
            )
            ,
          ],
        ),

      )
      );
  }
}














