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

  /// `أهلا بكم...`
  String get welcome {
    return Intl.message(
      'أهلا بكم...',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `فى careve للإهتمام بالتوعية بسرطان الثدي والعناية بصحة المرأة.`
  String get welcomeText {
    return Intl.message(
      'فى careve للإهتمام بالتوعية بسرطان الثدي والعناية بصحة المرأة.',
      name: 'welcomeText',
      desc: '',
      args: [],
    );
  }

  /// `تاكيد`
  String get confirm {
    return Intl.message(
      'تاكيد',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `هل انت متأكد؟`
  String get areYouSure {
    return Intl.message(
      'هل انت متأكد؟',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `إلغاء هذا الحجز`
  String get cancelAppointment {
    return Intl.message(
      'إلغاء هذا الحجز',
      name: 'cancelAppointment',
      desc: '',
      args: [],
    );
  }

  /// `الرقم القومى`
  String get nationalId {
    return Intl.message(
      'الرقم القومى',
      name: 'nationalId',
      desc: '',
      args: [],
    );
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

  /// `الفحص الذاتى`
  String get selfChecking {
    return Intl.message(
      'الفحص الذاتى',
      name: 'selfChecking',
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

  /// `الحجوزات`
  String get appointments {
    return Intl.message(
      'الحجوزات',
      name: 'appointments',
      desc: '',
      args: [],
    );
  }

  /// `حجز`
  String get appointment {
    return Intl.message(
      'حجز',
      name: 'appointment',
      desc: '',
      args: [],
    );
  }

  /// `السجلات الطبيه`
  String get medicalRecords {
    return Intl.message(
      'السجلات الطبيه',
      name: 'medicalRecords',
      desc: '',
      args: [],
    );
  }

  /// `السجل`
  String get record {
    return Intl.message(
      'السجل',
      name: 'record',
      desc: '',
      args: [],
    );
  }

  /// `اليوم`
  String get today {
    return Intl.message(
      'اليوم',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `قادمه`
  String get earlier {
    return Intl.message(
      'قادمه',
      name: 'earlier',
      desc: '',
      args: [],
    );
  }

  /// `فى وقت لاحق`
  String get later {
    return Intl.message(
      'فى وقت لاحق',
      name: 'later',
      desc: '',
      args: [],
    );
  }

  /// `إتصل`
  String get call {
    return Intl.message(
      'إتصل',
      name: 'call',
      desc: '',
      args: [],
    );
  }

  /// `هل أنت قلقه`
  String get worried {
    return Intl.message(
      'هل أنت قلقه',
      name: 'worried',
      desc: '',
      args: [],
    );
  }

  /// `أبحثي عن طبيب`
  String get findDoctor {
    return Intl.message(
      'أبحثي عن طبيب',
      name: 'findDoctor',
      desc: '',
      args: [],
    );
  }

  /// `لا تقلق ! الاّن يمكنك العثور على أطباء حولك والمتابعه معهم والتواصل أيضا فى أى وقت`
  String get doctorHint {
    return Intl.message(
      'لا تقلق ! الاّن يمكنك العثور على أطباء حولك والمتابعه معهم والتواصل أيضا فى أى وقت',
      name: 'doctorHint',
      desc: '',
      args: [],
    );
  }

  /// `يمكنك العثور على أفضل طبيب وأقرب مستشفى لمتابعة حالتك`
  String get splashText1 {
    return Intl.message(
      'يمكنك العثور على أفضل طبيب وأقرب مستشفى لمتابعة حالتك',
      name: 'splashText1',
      desc: '',
      args: [],
    );
  }

  /// `تواصل مع الأشخاص الآخرين الذين يعانون من نفس الأعراض`
  String get splashText2 {
    return Intl.message(
      'تواصل مع الأشخاص الآخرين الذين يعانون من نفس الأعراض',
      name: 'splashText2',
      desc: '',
      args: [],
    );
  }

  /// `يمكنك الحصول على مقالات و فحوصات للتحقق من صحتك`
  String get splashText3 {
    return Intl.message(
      'يمكنك الحصول على مقالات و فحوصات للتحقق من صحتك',
      name: 'splashText3',
      desc: '',
      args: [],
    );
  }

  /// `ما هي اعراض واسباب سرطان الثدي ؟`
  String get articlesQuestion1 {
    return Intl.message(
      'ما هي اعراض واسباب سرطان الثدي ؟',
      name: 'articlesQuestion1',
      desc: '',
      args: [],
    );
  }

  /// `كيف تحمي نفسك من سرطان الثدي ؟`
  String get articlesQuestion2 {
    return Intl.message(
      'كيف تحمي نفسك من سرطان الثدي ؟',
      name: 'articlesQuestion2',
      desc: '',
      args: [],
    );
  }

  /// `هل سرطان الثدي مرض وراثي ؟`
  String get articlesQuestion3 {
    return Intl.message(
      'هل سرطان الثدي مرض وراثي ؟',
      name: 'articlesQuestion3',
      desc: '',
      args: [],
    );
  }

  /// `ما هو سرطان الثدي وما هي نسبة الإصابة به؟`
  String get articlesQuestion4 {
    return Intl.message(
      'ما هو سرطان الثدي وما هي نسبة الإصابة به؟',
      name: 'articlesQuestion4',
      desc: '',
      args: [],
    );
  }

  /// `تعلمى كيف تقومى بالفحص الذاتى لسرطان الثدى`
  String get selfCheckingTitle {
    return Intl.message(
      'تعلمى كيف تقومى بالفحص الذاتى لسرطان الثدى',
      name: 'selfCheckingTitle',
      desc: '',
      args: [],
    );
  }

  /// `الخطوة الأولى (أمام المرآة)`
  String get firstStep {
    return Intl.message(
      'الخطوة الأولى (أمام المرآة)',
      name: 'firstStep',
      desc: '',
      args: [],
    );
  }

  /// `1- انظري إلى الثديين في المرآة مع وضعي يديك في وضع مستقيم على الجانبين ثم ضعي يديك في المنتصف.`
  String get firstStepSubStep1 {
    return Intl.message(
      '1- انظري إلى الثديين في المرآة مع وضعي يديك في وضع مستقيم على الجانبين ثم ضعي يديك في المنتصف.',
      name: 'firstStepSubStep1',
      desc: '',
      args: [],
    );
  }

  /// `2- تأكدي من إلقاء نظرة على شكل ولون حجم الثدي وأنه هو المعتاد بالنسبة لك دون تغيير أو بدون فرق.`
  String get firstStepSubStep2 {
    return Intl.message(
      '2- تأكدي من إلقاء نظرة على شكل ولون حجم الثدي وأنه هو المعتاد بالنسبة لك دون تغيير أو بدون فرق.',
      name: 'firstStepSubStep2',
      desc: '',
      args: [],
    );
  }

  /// `- ملاحظة العلامات التالية في الثدي`
  String get noticeSign {
    return Intl.message(
      '- ملاحظة العلامات التالية في الثدي',
      name: 'noticeSign',
      desc: '',
      args: [],
    );
  }

  /// `الخطوة الثانية (أمام المرآة)`
  String get secondStep {
    return Intl.message(
      'الخطوة الثانية (أمام المرآة)',
      name: 'secondStep',
      desc: '',
      args: [],
    );
  }

  /// `1- ارفعي يديك وتأكدي من عدم وجود التغييرات السابقة.`
  String get secondStepSubStep1 {
    return Intl.message(
      '1- ارفعي يديك وتأكدي من عدم وجود التغييرات السابقة.',
      name: 'secondStepSubStep1',
      desc: '',
      args: [],
    );
  }

  /// `2- أثناء رفع يديك ، لاحظي إفرازات غير طبيعية أو دماء من الحلمة اليمنى أو اليسرى.`
  String get secondStepSubStep2 {
    return Intl.message(
      '2- أثناء رفع يديك ، لاحظي إفرازات غير طبيعية أو دماء من الحلمة اليمنى أو اليسرى.',
      name: 'secondStepSubStep2',
      desc: '',
      args: [],
    );
  }

  /// `الخطوة الثالثة (في السرير)`
  String get thirdStep {
    return Intl.message(
      'الخطوة الثالثة (في السرير)',
      name: 'thirdStep',
      desc: '',
      args: [],
    );
  }

  /// `1- الاستلقاء على السرير واستخدام اليد اليسرى لفحص الثدي الأيمن واليد اليمنى لفحص الثدي الأيسر.`
  String get thirdStepStepSubStep1 {
    return Intl.message(
      '1- الاستلقاء على السرير واستخدام اليد اليسرى لفحص الثدي الأيمن واليد اليمنى لفحص الثدي الأيسر.',
      name: 'thirdStepStepSubStep1',
      desc: '',
      args: [],
    );
  }

  /// `2- باستخدام أطراف أصابعك ومن خلال حركة دائرية يتم فحص الثدي (الجلد والأنسجة)`
  String get thirdStepStepSubStep2 {
    return Intl.message(
      '2- باستخدام أطراف أصابعك ومن خلال حركة دائرية يتم فحص الثدي (الجلد والأنسجة)',
      name: 'thirdStepStepSubStep2',
      desc: '',
      args: [],
    );
  }

  /// `3- تأكدي من فحص الثدي بشكل كامل من أعلى إلى أسفل ومن جانب إلى آخر - من الترقوة إلى أعلى البطن ومن الإبط إلى منتصف الصدر.`
  String get thirdStepStepSubStep3 {
    return Intl.message(
      '3- تأكدي من فحص الثدي بشكل كامل من أعلى إلى أسفل ومن جانب إلى آخر - من الترقوة إلى أعلى البطن ومن الإبط إلى منتصف الصدر.',
      name: 'thirdStepStepSubStep3',
      desc: '',
      args: [],
    );
  }

  /// `4- حتى يتم التأكد من فحص الثدي بشكل كامل ، يمكنكي البدء من الحلمة ثم التحرك في دوائر أكبر وأكبر حتى تصل إلى المنطقة الخارجية من الثدي.`
  String get thirdStepStepSubStep4 {
    return Intl.message(
      '4- حتى يتم التأكد من فحص الثدي بشكل كامل ، يمكنكي البدء من الحلمة ثم التحرك في دوائر أكبر وأكبر حتى تصل إلى المنطقة الخارجية من الثدي.',
      name: 'thirdStepStepSubStep4',
      desc: '',
      args: [],
    );
  }

  /// `- لاحظى احساس لأى علامه من العلامات التاليه`
  String get noticeFeeling {
    return Intl.message(
      '- لاحظى احساس لأى علامه من العلامات التاليه',
      name: 'noticeFeeling',
      desc: '',
      args: [],
    );
  }

  /// `- الشعور بورم الإبط`
  String get armpitTumor {
    return Intl.message(
      '- الشعور بورم الإبط',
      name: 'armpitTumor',
      desc: '',
      args: [],
    );
  }

  /// `- الشعور العام`
  String get general {
    return Intl.message(
      '- الشعور العام',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `- سمك و آلم الثدي`
  String get thicknessAndPain {
    return Intl.message(
      '- سمك و آلم الثدي',
      name: 'thicknessAndPain',
      desc: '',
      args: [],
    );
  }

  /// `- ورم إدراكي`
  String get perceptualTumor {
    return Intl.message(
      '- ورم إدراكي',
      name: 'perceptualTumor',
      desc: '',
      args: [],
    );
  }

  /// `الخطوة الرابعة (في الحمام)`
  String get forthStep {
    return Intl.message(
      'الخطوة الرابعة (في الحمام)',
      name: 'forthStep',
      desc: '',
      args: [],
    );
  }

  /// `أعيدي فحص الاختبار السابق بنفس الطريقة المتبعة في الحمام.`
  String get forthStepSubStep1 {
    return Intl.message(
      'أعيدي فحص الاختبار السابق بنفس الطريقة المتبعة في الحمام.',
      name: 'forthStepSubStep1',
      desc: '',
      args: [],
    );
  }

  /// `المعلومات الشخصيه`
  String get personalData {
    return Intl.message(
      'المعلومات الشخصيه',
      name: 'personalData',
      desc: '',
      args: [],
    );
  }

  /// `معلومات العياده`
  String get clinicData {
    return Intl.message(
      'معلومات العياده',
      name: 'clinicData',
      desc: '',
      args: [],
    );
  }

  /// `المعلومات المهنيه`
  String get professionalData {
    return Intl.message(
      'المعلومات المهنيه',
      name: 'professionalData',
      desc: '',
      args: [],
    );
  }

  /// `أضف ملفك المهنى او موفقاتك الطبيه`
  String get attachCV {
    return Intl.message(
      'أضف ملفك المهنى او موفقاتك الطبيه',
      name: 'attachCV',
      desc: '',
      args: [],
    );
  }

  /// `ملفك المهنى او موفقاتك الطبيه ضروريه للتسجبل`
  String get cvValidation {
    return Intl.message(
      'ملفك المهنى او موفقاتك الطبيه ضروريه للتسجبل',
      name: 'cvValidation',
      desc: '',
      args: [],
    );
  }

  /// `أضف عيادات اكثر`
  String get addClinic {
    return Intl.message(
      'أضف عيادات اكثر',
      name: 'addClinic',
      desc: '',
      args: [],
    );
  }

  /// `الأيام`
  String get days {
    return Intl.message(
      'الأيام',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `سبت`
  String get sat {
    return Intl.message(
      'سبت',
      name: 'sat',
      desc: '',
      args: [],
    );
  }

  /// `أحد`
  String get sun {
    return Intl.message(
      'أحد',
      name: 'sun',
      desc: '',
      args: [],
    );
  }

  /// `أثنين`
  String get mon {
    return Intl.message(
      'أثنين',
      name: 'mon',
      desc: '',
      args: [],
    );
  }

  /// `ثلاثاء`
  String get tue {
    return Intl.message(
      'ثلاثاء',
      name: 'tue',
      desc: '',
      args: [],
    );
  }

  /// `أربعاء`
  String get wed {
    return Intl.message(
      'أربعاء',
      name: 'wed',
      desc: '',
      args: [],
    );
  }

  /// `خميس`
  String get thu {
    return Intl.message(
      'خميس',
      name: 'thu',
      desc: '',
      args: [],
    );
  }

  /// `جمعه`
  String get fri {
    return Intl.message(
      'جمعه',
      name: 'fri',
      desc: '',
      args: [],
    );
  }

  /// `من`
  String get from {
    return Intl.message(
      'من',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `إلى`
  String get to {
    return Intl.message(
      'إلى',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `المرضى`
  String get patients {
    return Intl.message(
      'المرضى',
      name: 'patients',
      desc: '',
      args: [],
    );
  }

  /// `أضف مقال`
  String get addAwareness {
    return Intl.message(
      'أضف مقال',
      name: 'addAwareness',
      desc: '',
      args: [],
    );
  }

  /// `نوع التوعيه`
  String get awarenessType {
    return Intl.message(
      'نوع التوعيه',
      name: 'awarenessType',
      desc: '',
      args: [],
    );
  }

  /// `رابط اليوتيوب`
  String get youTubeLink {
    return Intl.message(
      'رابط اليوتيوب',
      name: 'youTubeLink',
      desc: '',
      args: [],
    );
  }

  /// `المقال`
  String get article {
    return Intl.message(
      'المقال',
      name: 'article',
      desc: '',
      args: [],
    );
  }

  /// `السؤال`
  String get question {
    return Intl.message(
      'السؤال',
      name: 'question',
      desc: '',
      args: [],
    );
  }

  /// `الإجابه`
  String get answer {
    return Intl.message(
      'الإجابه',
      name: 'answer',
      desc: '',
      args: [],
    );
  }

  /// `العنوان`
  String get title {
    return Intl.message(
      'العنوان',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `سؤال و جواب`
  String get qa {
    return Intl.message(
      'سؤال و جواب',
      name: 'qa',
      desc: '',
      args: [],
    );
  }

  /// `فيديو`
  String get video {
    return Intl.message(
      'فيديو',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `أضف صوره لهذه التوعيتك`
  String get addImageForAwareness {
    return Intl.message(
      'أضف صوره لهذه التوعيتك',
      name: 'addImageForAwareness',
      desc: '',
      args: [],
    );
  }

  /// `محو`
  String get clear {
    return Intl.message(
      'محو',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `تعديل المواعيد والعيادات`
  String get editAppointmentsClinics {
    return Intl.message(
      'تعديل المواعيد والعيادات',
      name: 'editAppointmentsClinics',
      desc: '',
      args: [],
    );
  }

  /// `وقت النهايه يجب ان يكون بوقت بعد وقت البدايه وليس العكس`
  String get timeIsBefore {
    return Intl.message(
      'وقت النهايه يجب ان يكون بوقت بعد وقت البدايه وليس العكس',
      name: 'timeIsBefore',
      desc: '',
      args: [],
    );
  }

  /// `وقت البدايه لم يتم ضبطه`
  String get nullStartTime {
    return Intl.message(
      'وقت البدايه لم يتم ضبطه',
      name: 'nullStartTime',
      desc: '',
      args: [],
    );
  }

  /// `ضبط وقت البدايه`
  String get startTimeSet {
    return Intl.message(
      'ضبط وقت البدايه',
      name: 'startTimeSet',
      desc: '',
      args: [],
    );
  }

  /// `ضبط وقت النهايه`
  String get endTimeSet {
    return Intl.message(
      'ضبط وقت النهايه',
      name: 'endTimeSet',
      desc: '',
      args: [],
    );
  }

  /// `السيره الذاتيه/المواقفه الطبيه`
  String get cv {
    return Intl.message(
      'السيره الذاتيه/المواقفه الطبيه',
      name: 'cv',
      desc: '',
      args: [],
    );
  }

  /// `يبدو ان هناك عياده أو أكثر لم يُضع لها أيام ؛عليك ضبط بعض الأيام`
  String get daysEmpty {
    return Intl.message(
      'يبدو ان هناك عياده أو أكثر لم يُضع لها أيام ؛عليك ضبط بعض الأيام',
      name: 'daysEmpty',
      desc: '',
      args: [],
    );
  }

  /// `تكلفه الكشف`
  String get cost {
    return Intl.message(
      'تكلفه الكشف',
      name: 'cost',
      desc: '',
      args: [],
    );
  }

  /// `يجب رفع صوره شخصيه`
  String get imageValidation {
    return Intl.message(
      'يجب رفع صوره شخصيه',
      name: 'imageValidation',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد بيانات!`
  String get noData {
    return Intl.message(
      'لا يوجد بيانات!',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `بيانات الطبيب`
  String get doctorData {
    return Intl.message(
      'بيانات الطبيب',
      name: 'doctorData',
      desc: '',
      args: [],
    );
  }

  /// `العيادات`
  String get clinics {
    return Intl.message(
      'العيادات',
      name: 'clinics',
      desc: '',
      args: [],
    );
  }

  /// `أختر أسبوع`
  String get chooseWeek {
    return Intl.message(
      'أختر أسبوع',
      name: 'chooseWeek',
      desc: '',
      args: [],
    );
  }

  /// `لا يمكنك الحجز فى هذا الوقت أو التاريخ أختر واحداّ اخر`
  String get canNotBookThis {
    return Intl.message(
      'لا يمكنك الحجز فى هذا الوقت أو التاريخ أختر واحداّ اخر',
      name: 'canNotBookThis',
      desc: '',
      args: [],
    );
  }

  /// `لقد قمت بحجز هذا الموعد بنجاح {DateTime} !`
  String bookedSuccess(Object DateTime) {
    return Intl.message(
      'لقد قمت بحجز هذا الموعد بنجاح $DateTime !',
      name: 'bookedSuccess',
      desc: '',
      args: [DateTime],
    );
  }

  /// `النتيجه`
  String get result {
    return Intl.message(
      'النتيجه',
      name: 'result',
      desc: '',
      args: [],
    );
  }

  /// `من ماذا تعانى؟`
  String get suffer {
    return Intl.message(
      'من ماذا تعانى؟',
      name: 'suffer',
      desc: '',
      args: [],
    );
  }

  /// `قم برفع صوره للتشخيص أو أى تحاليل طبيه`
  String get diagnosis {
    return Intl.message(
      'قم برفع صوره للتشخيص أو أى تحاليل طبيه',
      name: 'diagnosis',
      desc: '',
      args: [],
    );
  }

  /// `أضف سجل طبى`
  String get addRecord {
    return Intl.message(
      'أضف سجل طبى',
      name: 'addRecord',
      desc: '',
      args: [],
    );
  }

  /// `تعديل السجل`
  String get editRecord {
    return Intl.message(
      'تعديل السجل',
      name: 'editRecord',
      desc: '',
      args: [],
    );
  }

  /// `حذف`
  String get delete {
    return Intl.message(
      'حذف',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `هل تريد حذف هذا السجل؟`
  String get removeRecord {
    return Intl.message(
      'هل تريد حذف هذا السجل؟',
      name: 'removeRecord',
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