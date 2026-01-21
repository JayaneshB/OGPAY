class Validators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@')) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8 || value.length > 35) {
      return 'Password must be 8–35 characters';
    }
    final regex = RegExp(r'^(?=.*[A-Z])(?=.*[!@#\$&*~]).{8,35}$');
    if (!regex.hasMatch(value)) {
      return 'Must include uppercase & special character';
    }
    return null;
  }
}
