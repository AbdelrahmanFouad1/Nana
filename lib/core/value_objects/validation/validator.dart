import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:easy_localization/easy_localization.dart';

class Validator {
  Validator.internal();

  static final Validator _instance = Validator.internal();

  factory Validator() => _instance;


  String? confirmPasswordValidator(
      {required String? confirmPassword, required String? password}) {
    if (confirmPassword.isBlank) {
      return null;
    } else if (confirmPassword != password) {
      return "register_confirm_password_error_tooltip".tr();
    } else {
      return null;
    }
  }

  String? emailValidator(String? value) {
    if (value.isBlank) {
      return null;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value!.trim())) {
      return 'register_email_error_tooltip'.tr();
    } else {
      return null;
    }
  }
}
