class AppValidator {
  /// Empty text validator
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is Required.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return "Invalid email adddress.";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    // Check for minimum password
    if (value.length < 6) {
      return "Password must be contain at least 6 characters long";
    }

    // Check for Uppercase letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must be contain at least one uppercase letter";
    }

    // Check for Number
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must be contain at least one number";
    }

    // Check for Spacial Character
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?:{}<>]'))) {
      return "Password must be contain at least one spacial character";
    }
    return null;
  }

  static String? validatePhoneNumber(String? val) {
    String? value = val;
    if (val?.length == 11) {
      value = value?.substring(1);
    }
    if (value == null || value.isEmpty) {
      return "Phone Number is required";
    }

    final phoneRegExp = RegExp(r'^\d{10}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digit Required)';
    }
    return null;
  }
}
