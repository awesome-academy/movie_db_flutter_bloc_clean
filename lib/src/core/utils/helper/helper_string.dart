class AppValidator {
  AppValidator._();

  static const String text = 'Vui lòng điền thông tin';

  static String? textValid(String? value) {
    if (value == null || value == '') {
      return text;
    }
    return null;
  }
}
