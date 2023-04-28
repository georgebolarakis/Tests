class Validator {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Required field';
    }
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(email)) {
      return 'Please enter a valid email Id';
    }
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Required field';
    }
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(password) || password.length < 8) {
      return 'Please add a valid password';
    }
  }
}
