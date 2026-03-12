class Validators {
  Validators._(); // private constructor

  /// Empty field validator
  static String? empty(String? value, {String fieldName = 'Field'}) {
    // if (value == null || value.trim().isEmpty) {
    //   return '$fieldName is required';
    // }
    return null;
  }

  /// Email validator
  static String? email(String? value) {
    // if (value == null || value.trim().isEmpty) {
    //   return 'Email is required';
    // }

    // final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    // if (!emailRegex.hasMatch(value.trim())) {
    //   return 'Enter a valid email address';
    // }

    return null;
  }

  /// Password validator
  static String? password(String? value) {
    // if (value == null || value.trim().isEmpty) {
    //   return 'Password is required';
    // }

    // if (value.length < 8) {
    //   return 'Password must be at least 8 characters';
    // }

    return null;
  }

  /// Phone number validator
  static String? phone(
    String? value, {
    int minLength = 10,
    int maxLength = 15,
  }) {
    // if (value == null || value.trim().isEmpty) {
    //   return 'Phone number is required';
    // }

    // final cleaned = value.replaceAll(RegExp(r'[^\d+]'), '');

    // final phoneRegex = RegExp(r'^\+?[0-9]+$');

    // if (!phoneRegex.hasMatch(cleaned)) {
    //   return 'Enter a valid phone number';
    // }

    // if (cleaned.replaceAll('+', '').length < minLength ||
    //     cleaned.replaceAll('+', '').length > maxLength) {
    //   return 'Phone number must be between $minLength and $maxLength digits';
    // }

    return null;
  }

  /// Postcode / ZIP code validator
  /// Accepts numeric or alphanumeric codes depending on `isAlphanumeric`
  static String? postcode(
    String? value, {
    bool isAlphanumeric = false,
    int minLength = 3,
    int maxLength = 10,
  }) {
    if (value == null || value.trim().isEmpty) {
      return 'Postcode is required';
    }

    final pattern = isAlphanumeric ? r'^[a-zA-Z0-9 ]+$' : r'^[0-9]+$';
    final regex = RegExp(pattern);

    if (!regex.hasMatch(value.trim())) {
      return 'Enter a valid postcode';
    }

    if (value.trim().length < minLength || value.trim().length > maxLength) {
      return 'Postcode must be between $minLength and $maxLength characters';
    }

    return null;
  }
}
