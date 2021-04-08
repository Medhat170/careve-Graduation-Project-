import 'package:careve/generated/l10n.dart';

const imagesPath = 'assets/images/';
const iconsPath = 'assets/icons/';
const url = 'https://laravelbreast.000webhostapp.com/public/api/';

class PathUtil {
  static const String userImage = imagesPath + 'female_avatar.png';
  static const String welcomeImage = imagesPath + 'hands_background.png';
  static const String splashscreen1Image = imagesPath + 'undraw_splash1.png';
  static const String splashscreen3Image = imagesPath + 'undraw_splash3.png';
  static const String doctorsImage = imagesPath + 'doctors.png';
  static const String hospitalsImage = imagesPath + 'hospitals.png';
  static const String selfCareImage = imagesPath + 'selfCare.png';
  static const String articlesImage = imagesPath + 'articles.png';
  static const String defaultUserImage = imagesPath + 'defaultUserImage.png';
  static const String favIcon = iconsPath + 'fav.png';
  static const String facebookIcon = iconsPath + 'facebookIcon.png';
  static const String googleIcon = iconsPath + 'googleIcon.png';
  static const String logoIcon = iconsPath + 'logo.png';
}

class ApiPath {
  static const String patientSignUp = url + 'patientsignup?';
  static const String login = url + 'login';
}
