
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:store/utilis/constants/sizes.dart'; 

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
     child: Padding(
     padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
         child: Column(
           children: [
             TextFormField(
               decoration: const InputDecoration(
                 prefixIcon: Icon(Iconsax.direct_right),
                 labelText: 'E-mail',
                 // hintText: 'Enter your email',
               ),
             ),
             const SizedBox(height: TSizes.spaceBtwInputFields,),
             TextFormField(
               decoration: const InputDecoration(
                 prefixIcon: Icon(Iconsax.password_check),
                 labelText: 'Password',
                 // hintText: 'Enter your email',
                 suffixIcon: Icon(Iconsax.eye_slash),
               ),
             ),
             const SizedBox(height: TSizes.spaceBtwInputFields/2,),
         
             ///Remember me and Forgot password
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Row(
                   children: [
                     Checkbox(value: true, onChanged: (value) {}),
                     Text('Remember me', style: Theme.of(context).textTheme.bodyMedium),
                   ],
                 ),
                 TextButton(
                   onPressed: () {},
                   child: Text('Forgot password?', style: Theme.of(context).textTheme.bodyMedium),
                 ),
               ],
             ),
             const SizedBox(height: TSizes.spaceBtwSections,),
             SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                 onPressed: () {},
                 child: const Text('Login',),
               ),
             ),
             const SizedBox(height: TSizes.spaceBtwSections,),
             SizedBox(
               width: double.infinity,
               child: OutlinedButton(
                 onPressed: () {},
                 child: const Text('Create Account',),
               ),
             ),
         ],
         ),
                    ),
                    );
  }
}

