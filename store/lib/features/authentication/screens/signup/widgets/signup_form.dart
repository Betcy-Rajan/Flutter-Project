
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/features/authentication/screens/signup/verify_email.dart';
import 'package:store/utilis/constants/sizes.dart';
import 'package:store/utilis/constants/colors.dart';
import 'package:store/utilis/helpers/helper_functions.dart';


class TSignupForm extends StatelessWidget {
  const  TSignupForm({
    super.key,
   
  });
  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return Form(child: 
    Column(
     children: [
       Row(
         children: [
           Expanded(
             child: TextFormField(
               expands: false,
               decoration:  const InputDecoration(
                 hintText: 'First Name',
                 prefixIcon: Icon(Iconsax.user),
               ),
               
             ),
           ),
           const SizedBox(width: TSizes.spaceBtwInputFields,),
           Expanded(
             child: TextFormField(
               expands: false,
               decoration:  const InputDecoration(
                 hintText: 'Last Name',
                 prefixIcon: Icon(Iconsax.user),
               ),
               
             ),
           ),
         ],
       ),
       const SizedBox(height: TSizes.spaceBtwInputFields,),
       //username
        TextFormField(
               expands: false,
               decoration:  const InputDecoration(
                 hintText: 'User Name',
                 prefixIcon: Icon(Iconsax.user_edit),
               ),
         ),
         const SizedBox(height: TSizes.spaceBtwInputFields,),
         //email
          TextFormField(
               expands: false,
               decoration:  const InputDecoration(
                 hintText: 'Email',
                 prefixIcon: Icon(Iconsax.user_edit),
               ),
         ),
         const SizedBox(height: TSizes.spaceBtwInputFields,),
         //phone Number
           TextFormField(
                 expands: false,
                 decoration:  const InputDecoration(
                   hintText: 'Phone Number',
                   prefixIcon: Icon(Iconsax.call),
                 ),
           ),
           const SizedBox(height: TSizes.spaceBtwInputFields,),
           //password
           TextFormField(
                 expands: false,
                 decoration:  const InputDecoration(
                   hintText: 'Password',
                   prefixIcon: Icon(Iconsax.password_check),
                   suffixIcon: Icon(Iconsax.eye_slash),
                 ),
           ),
           const SizedBox(height: TSizes.spaceBtwInputFields,),
    
           //Terms and Conditions
           Row(children: [
             Checkbox(value: true, onChanged: (value) {}),
             const SizedBox(width: TSizes.spaceBtwItems,),
             Text.rich( 
               TextSpan(
               children: [
                 TextSpan(
                   text: 'I agree to the ',
                   style: Theme.of(context).textTheme.bodySmall,
                 ),
                 TextSpan(
                   text: 'Privacy Policy',
                   style: Theme.of(context).textTheme.bodyMedium!.apply(
                     color: dark ? TColors.white :TColors.primaryColor,
                     decoration: TextDecoration.underline,
                     decorationColor: dark ? TColors.white :TColors.primaryColor,
    
                   ),
                 ),
                 TextSpan(
                   text: ' and ',
                   style:  Theme.of(context).textTheme.bodySmall,
                 ),
                    TextSpan(
                   text: 'Terms of Use',
                   style: Theme.of(context).textTheme.bodyMedium!.apply(
                     color: dark ? TColors.white :TColors.primaryColor,
                     decoration: TextDecoration.underline,
                     decorationColor: dark ? TColors.white :TColors.primaryColor,
    
                   ),
                 ),
               ],
             ),),
             
           ],),
           const SizedBox(height: TSizes.spaceBtwInputFields,),
           ///Sign Up Button
           SizedBox(
             width: double.infinity,
             child: ElevatedButton(
               onPressed: () {
                Get.to(() => const VerifyEmailScreen());
               },
               child: const Text('Create Account',),
             ),
           ),
    
     ],
    
    ),
    );
  }
}