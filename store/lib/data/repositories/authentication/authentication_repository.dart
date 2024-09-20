import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store/features/authentication/screens/login/login.dart';
import 'package:store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:store/features/authentication/screens/signup/verify_email.dart';
import 'package:store/utilis/exceptions/firebase_auth_exceptions.dart';
import 'package:store/utilis/exceptions/firebase_exceptions.dart';
import 'package:store/utilis/exceptions/format_exceptions.dart';
import 'package:store/utilis/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }
  screenRedirect() async {
    User? user = _auth.currentUser;
    if(user != null) {
      if(user.emailVerified) {
        Get.offAll(() => const LoginScreen());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: user.email));
      }
    } else {
        //Local Storage
        deviceStorage.writeIfNull('isFirstTime', true);
        deviceStorage.read('isFirstTime') != true ? Get.offAll(()=> const LoginScreen()): Get.offAll(() => const OnBoardingScreen());
     
    }
  

  }

  ///Email Authentication - Sign In
  
  ///Email Authentication - Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
       throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
       throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message; 
    } catch (e) {
      throw 'Something went wrong.Please try again';
    }
   
  }
  
  ///ReAuthenticate - Reauthenticate User
  ///EmailVerification -  Email Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.Please try again';
    }
  }
  ///EmailAuthentication - Forgot Password
  

  ///Google Authentication - Google
  ///Facebook Authentication - Facebook
  
  ///LogoutUser - Logout User
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.Please try again';
    }
  }
  ///DeleteUser - Delete User
}