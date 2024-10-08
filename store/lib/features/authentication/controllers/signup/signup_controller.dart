import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/data/repositories/authentication/authentication_repository.dart';
import 'package:store/data/repositories/user/user_repository.dart';
import 'package:store/features/authentication/screens/signup/verify_email.dart';
import 'package:store/features/personalization/models/user_models.dart';
import 'package:store/utilis/constants/image_strings.dart';
import 'package:store/utilis/helpers/network_manager.dart';
import 'package:store/utilis/popups/full_screen_loaders.dart';
import 'package:store/utilis/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  //Variables
  final hidePassword = true.obs; //Hide Password
  final checkbox = true.obs; //Checkbox
  final email = TextEditingController(); //Controller for Email
  final firstName = TextEditingController(); //Controller for First Name
  final lastName = TextEditingController(); //Controller for last Name
  final phoneNumber = TextEditingController(); //Controller for Phone Number
  final username = TextEditingController(); //Controller for First Name
  final password = TextEditingController(); //Controller for Password
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); //Form Key


 Future<void> signup() async {
  try {
    //start loading
    TFullScreenLoader.openLoadingDialog('We are processing your information',TImages.docerAnimation);

    //Check Internet Connection
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
       TFullScreenLoader.stopLoading();
      return;
    }
    //Form Validation
    if(!signupFormKey.currentState!.validate()) {
      TFullScreenLoader.stopLoading();
      return;
    }
    //Privacy Policy Check
    if (!checkbox.value) {
      //Show Error Message
      TLoaders.errorSnackBar(title: 'Please accept the terms and conditions',message: 'You must accept the terms and conditions to continue');
       TFullScreenLoader.stopLoading();
      return;
    }
    //Register User in Firebase Authentication and Save User Data in Firebase
   UserCredential userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
    //Save Authenticated User Data in Firbase Firestore
    final newUser = UserModel(
      id: userCredential.user!.uid,
      email: email.text.trim(),
      firstName: firstName.text.trim(),
      lastName: lastName.text.trim(),
      phoneNumber: phoneNumber.text.trim(),
      username: username.text.trim(),
      profilePicture: '',
    );
    final userRepository = Get.put(UserRepository());
    await userRepository.saveUserRecord(newUser);
    //Stop Loader
     TFullScreenLoader.stopLoading();
     
    //Show Success Message
    TLoaders.successSnackBar(title: 'Account Created Successfully',message: 'Please verify your email to continue');
    //Move to Verify Email Screen
    Get.to(() =>  VerifyEmailScreen(email: email.text.trim(),));

  } catch (e) {
    //Show Error Message
    TLoaders.errorSnackBar(title: 'An error occurred, please try again',message:e.toString());
    TFullScreenLoader.stopLoading();
  }
  // } finally {
  //   //Remove Loader
  //  
  //   }
 
}
}