class TValidator {
   static final emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email cannot be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password cannot be empty';
    } else if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? validatePhoneNumber(String phoneNumber) {
    final phoneRegExp = RegExp(r'^\+?[0-9]{10,15}$');
    if (phoneNumber.isEmpty) {
      return 'Phone number cannot be empty';
    } else if (!phoneRegExp.hasMatch(phoneNumber)) {
      return 'Enter a valid phone number';
    }
    return null;
  }
  
}