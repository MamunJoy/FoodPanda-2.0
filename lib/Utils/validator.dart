part of 'design_utils.dart';

class AuthValidator {

  static String? nameValidator(String? value) {
    if (value?.trim().isEmpty ?? true) return "required!";

    if (value != null && !RegExp(r'^[a-z A-Z]+$').hasMatch(value.trim())) {
      return "Invalid Name!";
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value?.trim().isEmpty ?? true) return "required!";
    if (value != null && value.length != 11) {
      return "Phone number must be of exact 10 digits!";
    }
    if (value != null && !GetUtils.isPhoneNumber(value.trim())) {
      return "Invalid phone number!";
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value?.trim().isEmpty ?? true) return "required!";

    if (value != null && !GetUtils.isEmail(value.trim())) {
      return "Invalid Email Address!";
    }
    return null;
  }

  static String? emptyNullValidator(
      String? value, {
        String? errorMessage = "required!",
      }) {
    //TODO: Add Extra Validation If Needed
    if (value?.trim().isEmpty ?? true) return errorMessage;

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value?.trim().isEmpty ?? true) return "required!";

    if (value != null && value.trim().length < 6) {
      return "Password must contain at least 5 characters";
    }

    return null;
  }

  static String? urlValidator(String? value) {
    if (value?.trim().isEmpty ?? true) return "required!";

    if (value != null && !value.isURL) {
      return "Invalid URL";
    }

    return null;
  }
}
