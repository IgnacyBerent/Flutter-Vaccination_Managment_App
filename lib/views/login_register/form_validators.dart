String? isEmptyValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  }
  return null;
}

String? isEmailValidator(String? value) {
  const pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
  final regExp = RegExp(pattern);

  if (value == null || value.isEmpty) {
    return 'Please enter an email address';
  }

  if (!regExp.hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}

String? isValidPasswordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter a password';
  }
  if (value.length < 6) {
    return 'Minimum 6 characters';
  }
  if (!value.contains(RegExp(r'[A-Z]'))) {
    return 'Needs 1 uppercase';
  }
  if (!value.contains(RegExp(r'[a-z]'))) {
    return 'Needs 1 lowercase';
  }
  if (!value.contains(RegExp(r'[0-9]'))) {
    return 'Needs 1 digit';
  }
  if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return 'Needs 1 special char';
  }
  return null;
}

String? doesMatchValidator(String? value, String? match) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password confirmation';
  }
  if (value != match) {
    return 'Passwords do not match';
  }
  return null;
}
