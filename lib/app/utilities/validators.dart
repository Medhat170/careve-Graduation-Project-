import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/generated/l10n.dart';

class QuickGenericValidator<T> {
  final bool isRequired;
  final String Function(T value) extraValidation;

  const QuickGenericValidator({
    this.isRequired,
    this.extraValidation,
  });

  String call(T value) => validate(value);

  String validate(T value) {
    if (isRequired == true) {
      if (value == null) {
        return S.current.inputNull;
      }
    }
    if (extraValidation != null) {
      final res = extraValidation(value);
      if (res != null) {
        return res;
      }
    }
    return null;
  }
}

class QuickTextValidator {
  final bool isRequired;
  final bool isEmail;
  final bool isPhone;
  final bool isNationalId;
  final int hasMinLength;
  final int hasMaxLength;
  final String Function(String value) extraValidation;

  const QuickTextValidator({
    this.isRequired = true,
    this.isNationalId,
    this.isEmail,
    this.isPhone,
    this.hasMinLength,
    this.extraValidation,
    this.hasMaxLength,
  });

  String call(String value) => validate(value);

  String validate(String value) {
    if (isRequired == true) {
      if (value == null || value.isEmpty) {
        return S.current.inputNull;
      }
    }
    if (value != null && value.isNotEmpty) {
      if (isNationalId == true) {
        if (value.length != 14 || int.tryParse(value) == null) {
          return S.current.invalidNationalId;
        }
      }
      if (isEmail == true) {
        if (!AppUtil.emailValidatorRegExp.hasMatch(value)) {
          return S.current.invalidEmail;
        }
      }
      if (isPhone == true) {
        if (!AppUtil.phoneValidatorRegExp.hasMatch(value)) {
          return S.current.invalidPhoneNumber;
        }
      }
      if (hasMinLength != null) {
        if (value.length < hasMinLength) {
          return S.current.hasMinLength(hasMinLength);
        }
      }
      if (extraValidation != null) {
        final res = extraValidation(value);
        if (res != null) {
          return res;
        }
      }
    }
    return null;
  }
}
