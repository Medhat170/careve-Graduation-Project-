// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `برجاء إدخال {length} حروف على الأقل`
  String hasMinLength(Object length) {
    return Intl.message(
      'برجاء إدخال $length حروف على الأقل',
      name: 'hasMinLength',
      desc: '',
      args: [length],
    );
  }

  /// `من فضلك أدخل كلمة المرور الجديده لإعادة ضبتها`
  String get resetPasswordDesc {
    return Intl.message(
      'من فضلك أدخل كلمة المرور الجديده لإعادة ضبتها',
      name: 'resetPasswordDesc',
      desc: '',
      args: [],
    );
  }

  /// `كلمتي المرور غير متطابقتان !`
  String get passwordsDoNotMatch {
    return Intl.message(
      'كلمتي المرور غير متطابقتان !',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `كود التفعيل مكون من 6 أرقام !`
  String get sixDigitsIsAMust {
    return Intl.message(
      'كود التفعيل مكون من 6 أرقام !',
      name: 'sixDigitsIsAMust',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك أدخل رقم هاتفك لإرسال كود التفعيل`
  String get phoneNeededDesc {
    return Intl.message(
      'من فضلك أدخل رقم هاتفك لإرسال كود التفعيل',
      name: 'phoneNeededDesc',
      desc: '',
      args: [],
    );
  }

  /// `تم إرسال كود من 6 أرقام إلى رقم هاتفك قم بإدراجه للإستمرار`
  String get verifyText {
    return Intl.message(
      'تم إرسال كود من 6 أرقام إلى رقم هاتفك قم بإدراجه للإستمرار',
      name: 'verifyText',
      desc: '',
      args: [],
    );
  }

  /// `نسيت كلمه المرور؟`
  String get forgetPassword {
    return Intl.message(
      'نسيت كلمه المرور؟',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك ادخل بريدك الإلكترونى`
  String get emailNull {
    return Intl.message(
      'من فضلك ادخل بريدك الإلكترونى',
      name: 'emailNull',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك أدخل رقم قومى صحيح`
  String get invalidNationalId {
    return Intl.message(
      'من فضلك أدخل رقم قومى صحيح',
      name: 'invalidNationalId',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك ادخل كلمة مرور صحيحه`
  String get invalidPassword {
    return Intl.message(
      'من فضلك ادخل كلمة مرور صحيحه',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك التأكد من كلمة المرور`
  String get invalidConfirmPassword {
    return Intl.message(
      'من فضلك التأكد من كلمة المرور',
      name: 'invalidConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك ادخل كلمة المرور`
  String get passwordNull {
    return Intl.message(
      'من فضلك ادخل كلمة المرور',
      name: 'passwordNull',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور قصيره`
  String get shortPassword {
    return Intl.message(
      'كلمة المرور قصيره',
      name: 'shortPassword',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك ادخل الاسم`
  String get nameNull {
    return Intl.message(
      'من فضلك ادخل الاسم',
      name: 'nameNull',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك ادخل رقم الهاتف`
  String get phoneNumberNull {
    return Intl.message(
      'من فضلك ادخل رقم الهاتف',
      name: 'phoneNumberNull',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك أدخل رقم هاتف صالح`
  String get invalidPhoneNumber {
    return Intl.message(
      'من فضلك أدخل رقم هاتف صالح',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك أدخل بريد إلكترونى صالح`
  String get invalidEmail {
    return Intl.message(
      'من فضلك أدخل بريد إلكترونى صالح',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `رقم الهاتف قصير`
  String get shortPhone {
    return Intl.message(
      'رقم الهاتف قصير',
      name: 'shortPhone',
      desc: '',
      args: [],
    );
  }

  /// `هذا الحقل مطلوب!`
  String get inputNull {
    return Intl.message(
      'هذا الحقل مطلوب!',
      name: 'inputNull',
      desc: '',
      args: [],
    );
  }

  /// `حدث خطأ اثناء التسجيل`
  String get signInFailed {
    return Intl.message(
      'حدث خطأ اثناء التسجيل',
      name: 'signInFailed',
      desc: '',
      args: [],
    );
  }

  /// `تأكد من الرقم القومى وكلمه المرور`
  String get idOrPasswordIsWrong {
    return Intl.message(
      'تأكد من الرقم القومى وكلمه المرور',
      name: 'idOrPasswordIsWrong',
      desc: '',
      args: [],
    );
  }

  /// `فشل الاتصال حاول مره اخرى`
  String get noNetwork {
    return Intl.message(
      'فشل الاتصال حاول مره اخرى',
      name: 'noNetwork',
      desc: '',
      args: [],
    );
  }

  /// `البيانات ليست مكتمله!`
  String get dataIsNotCompleted {
    return Intl.message(
      'البيانات ليست مكتمله!',
      name: 'dataIsNotCompleted',
      desc: '',
      args: [],
    );
  }

  /// `اختر لغه العرض المفضله`
  String get selectLanguageTitle {
    return Intl.message(
      'اختر لغه العرض المفضله',
      name: 'selectLanguageTitle',
      desc: '',
      args: [],
    );
  }

  /// `لديك حساب بالفعل؟`
  String get alreadyHaveAcc {
    return Intl.message(
      'لديك حساب بالفعل؟',
      name: 'alreadyHaveAcc',
      desc: '',
      args: [],
    );
  }

  /// `ليس لديك حساب؟`
  String get donNotHaveAcc {
    return Intl.message(
      'ليس لديك حساب؟',
      name: 'donNotHaveAcc',
      desc: '',
      args: [],
    );
  }

  /// `اللغه`
  String get language {
    return Intl.message(
      'اللغه',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `مسح الذاكره`
  String get clearCache {
    return Intl.message(
      'مسح الذاكره',
      name: 'clearCache',
      desc: '',
      args: [],
    );
  }

  /// `إكتشف`
  String get explore {
    return Intl.message(
      'إكتشف',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get signIn {
    return Intl.message(
      'تسجيل الدخول',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل جديد`
  String get signUp {
    return Intl.message(
      'تسجيل جديد',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `التالي`
  String get next {
    return Intl.message(
      'التالي',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `تخطى`
  String get skip {
    return Intl.message(
      'تخطى',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `إستمرار`
  String get continueNext {
    return Intl.message(
      'إستمرار',
      name: 'continueNext',
      desc: '',
      args: [],
    );
  }

  /// `رجوع`
  String get back {
    return Intl.message(
      'رجوع',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `الدخول كضيف`
  String get guest {
    return Intl.message(
      'الدخول كضيف',
      name: 'guest',
      desc: '',
      args: [],
    );
  }

  /// `تم`
  String get done {
    return Intl.message(
      'تم',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `الوظيفة`
  String get jobDesc {
    return Intl.message(
      'الوظيفة',
      name: 'jobDesc',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور`
  String get password {
    return Intl.message(
      'كلمة المرور',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد كلمة المرور`
  String get confirmPassword {
    return Intl.message(
      'تأكيد كلمة المرور',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `تاريخ الميلاد`
  String get birthDate {
    return Intl.message(
      'تاريخ الميلاد',
      name: 'birthDate',
      desc: '',
      args: [],
    );
  }

  /// `تنبيه`
  String get alert {
    return Intl.message(
      'تنبيه',
      name: 'alert',
      desc: '',
      args: [],
    );
  }

  /// `بطاقة الخصم`
  String get discountCard {
    return Intl.message(
      'بطاقة الخصم',
      name: 'discountCard',
      desc: '',
      args: [],
    );
  }

  /// `الملف الشخصى`
  String get profile {
    return Intl.message(
      'الملف الشخصى',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `المفضلات`
  String get favourite {
    return Intl.message(
      'المفضلات',
      name: 'favourite',
      desc: '',
      args: [],
    );
  }

  /// `الإعدادات`
  String get settings {
    return Intl.message(
      'الإعدادات',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `معلومات عنا`
  String get aboutUs {
    return Intl.message(
      'معلومات عنا',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الخروج`
  String get signOut {
    return Intl.message(
      'تسجيل الخروج',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `الإشعارات`
  String get notifications {
    return Intl.message(
      'الإشعارات',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد بيانات`
  String get thisEmpty {
    return Intl.message(
      'لا توجد بيانات',
      name: 'thisEmpty',
      desc: '',
      args: [],
    );
  }

  /// `لم نعثر على اى بيانات`
  String get didNotFind {
    return Intl.message(
      'لم نعثر على اى بيانات',
      name: 'didNotFind',
      desc: '',
      args: [],
    );
  }

  /// `بيانات`
  String get data {
    return Intl.message(
      'بيانات',
      name: 'data',
      desc: '',
      args: [],
    );
  }

  /// `بحث`
  String get search {
    return Intl.message(
      'بحث',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `انطلق`
  String get go {
    return Intl.message(
      'انطلق',
      name: 'go',
      desc: '',
      args: [],
    );
  }

  /// `الرئيسيه`
  String get home {
    return Intl.message(
      'الرئيسيه',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `المزيد`
  String get more {
    return Intl.message(
      'المزيد',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `تحديد البيانات المعروضه`
  String get filter {
    return Intl.message(
      'تحديد البيانات المعروضه',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `إرسال`
  String get send {
    return Intl.message(
      'إرسال',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `عنوان البريد الإلكترونى`
  String get email {
    return Intl.message(
      'عنوان البريد الإلكترونى',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `العنوان`
  String get address {
    return Intl.message(
      'العنوان',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `مزيد من التفاصيل`
  String get moreDetails {
    return Intl.message(
      'مزيد من التفاصيل',
      name: 'moreDetails',
      desc: '',
      args: [],
    );
  }

  /// `أضف ملف`
  String get attachFile {
    return Intl.message(
      'أضف ملف',
      name: 'attachFile',
      desc: '',
      args: [],
    );
  }

  /// `{count} ملفات تم رفعها `
  String filesUploaded(Object count) {
    return Intl.message(
      '$count ملفات تم رفعها ',
      name: 'filesUploaded',
      desc: '',
      args: [count],
    );
  }

  /// `الإسم`
  String get name {
    return Intl.message(
      'الإسم',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `الشركه`
  String get company {
    return Intl.message(
      'الشركه',
      name: 'company',
      desc: '',
      args: [],
    );
  }

  /// `النوع`
  String get gender {
    return Intl.message(
      'النوع',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `تاريخ البدء`
  String get startDate {
    return Intl.message(
      'تاريخ البدء',
      name: 'startDate',
      desc: '',
      args: [],
    );
  }

  /// `تاريخ الإنتهاء`
  String get endDate {
    return Intl.message(
      'تاريخ الإنتهاء',
      name: 'endDate',
      desc: '',
      args: [],
    );
  }

  /// `رقم الهاتف`
  String get phoneNumber {
    return Intl.message(
      'رقم الهاتف',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `تعديل الملف الشخصى`
  String get editProfile {
    return Intl.message(
      'تعديل الملف الشخصى',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `تعديل`
  String get edit {
    return Intl.message(
      'تعديل',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `الموقع`
  String get location {
    return Intl.message(
      'الموقع',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `الفئه`
  String get category {
    return Intl.message(
      'الفئه',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `التخصص`
  String get specialization {
    return Intl.message(
      'التخصص',
      name: 'specialization',
      desc: '',
      args: [],
    );
  }

  /// `الهاتف`
  String get telPhone {
    return Intl.message(
      'الهاتف',
      name: 'telPhone',
      desc: '',
      args: [],
    );
  }

  /// `المفضله`
  String get favorite {
    return Intl.message(
      'المفضله',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `الدردشه`
  String get chat {
    return Intl.message(
      'الدردشه',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `الرسائل`
  String get messages {
    return Intl.message(
      'الرسائل',
      name: 'messages',
      desc: '',
      args: [],
    );
  }

  /// `أكتب رساله`
  String get typeMessage {
    return Intl.message(
      'أكتب رساله',
      name: 'typeMessage',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد رسائل الى الان`
  String get noMessagesYet {
    return Intl.message(
      'لا يوجد رسائل الى الان',
      name: 'noMessagesYet',
      desc: '',
      args: [],
    );
  }

  /// `إلغاء`
  String get cancel {
    return Intl.message(
      'إلغاء',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `تحقق من اتصالك بالانترنت`
  String get socketException {
    return Intl.message(
      'تحقق من اتصالك بالانترنت',
      name: 'socketException',
      desc: '',
      args: [],
    );
  }

  /// `تعذر الاتصال بالخادم`
  String get httpException {
    return Intl.message(
      'تعذر الاتصال بالخادم',
      name: 'httpException',
      desc: '',
      args: [],
    );
  }

  /// `حدث خطأ غير متوقع`
  String get formatException {
    return Intl.message(
      'حدث خطأ غير متوقع',
      name: 'formatException',
      desc: '',
      args: [],
    );
  }

  /// `إعادة المحاوله`
  String get retry {
    return Intl.message(
      'إعادة المحاوله',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `لم تقم بتغيير أى بيانات`
  String get noChangedData {
    return Intl.message(
      'لم تقم بتغيير أى بيانات',
      name: 'noChangedData',
      desc: '',
      args: [],
    );
  }

  /// `غير مصرح لك !`
  String get unAuthorized {
    return Intl.message(
      'غير مصرح لك !',
      name: 'unAuthorized',
      desc: '',
      args: [],
    );
  }

  /// `دكتور/ه`
  String get doctor {
    return Intl.message(
      'دكتور/ه',
      name: 'doctor',
      desc: '',
      args: [],
    );
  }

  /// `مستخدم عادى`
  String get normalUser {
    return Intl.message(
      'مستخدم عادى',
      name: 'normalUser',
      desc: '',
      args: [],
    );
  }

  /// `أهلاً, `
  String get welcomeBack {
    return Intl.message(
      'أهلاً, ',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `أطباء`
  String get doctors {
    return Intl.message(
      'أطباء',
      name: 'doctors',
      desc: '',
      args: [],
    );
  }

  /// `العناية بالنفس`
  String get selfCare {
    return Intl.message(
      'العناية بالنفس',
      name: 'selfCare',
      desc: '',
      args: [],
    );
  }

  /// `مستشفيات`
  String get hospitals {
    return Intl.message(
      'مستشفيات',
      name: 'hospitals',
      desc: '',
      args: [],
    );
  }

  /// `التوعيه`
  String get awareness {
    return Intl.message(
      'التوعيه',
      name: 'awareness',
      desc: '',
      args: [],
    );
  }

  /// `مقالات`
  String get articles {
    return Intl.message(
      'مقالات',
      name: 'articles',
      desc: '',
      args: [],
    );
  }

  /// `أسئلة شائعة`
  String get commonQuestions {
    return Intl.message(
      'أسئلة شائعة',
      name: 'commonQuestions',
      desc: '',
      args: [],
    );
  }

  /// `فيديوهات`
  String get videos {
    return Intl.message(
      'فيديوهات',
      name: 'videos',
      desc: '',
      args: [],
    );
  }

  /// `فصيلة الدم`
  String get bloodType {
    return Intl.message(
      'فصيلة الدم',
      name: 'bloodType',
      desc: '',
      args: [],
    );
  }

  /// `المحفوظات`
  String get saved {
    return Intl.message(
      'المحفوظات',
      name: 'saved',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}