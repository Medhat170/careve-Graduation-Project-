const imagesPath = 'assets/images/';
const iconsPath = 'assets/icons/';
const lottiePath = 'assets/lottie/';
const url = 'https://laravelbreast.000webhostapp.com/public/api/';
const blogUrl = 'http://careve.ga/public/api/';

class PathUtil {
  static const String arImage = '${imagesPath}eg.png';
  static const String enImage = '${imagesPath}uk.png';
  static const String appointmentImage = '${imagesPath}appointment.png';
  static const String patientImage = '${imagesPath}patient.png';
  static const String chatImage = '${imagesPath}chat.png';
  static const String moreImage = '${imagesPath}more.png';
  static const String worriedWomanImage = '${imagesPath}worried_woman.png';
  static const String userImage = '${imagesPath}female_avatar.png';
  static const String welcomeImage = '${imagesPath}hands_background.jpg';
  static const String splashscreen1Image = '${imagesPath}undraw_splash1.png';
  static const String splashscreen3Image = '${imagesPath}undraw_splash3.png';
  static const String doctorsImage = '${imagesPath}doctors.png';
  static const String hospitalsImage = '${imagesPath}hospitals.png';
  static const String selfCareImage = '${imagesPath}selfCare.png';
  static const String articlesImage = '${imagesPath}articles.png';
  static const String defaultUserImage = '${imagesPath}defaultUserImage.png';
  static const String favIcon = '${iconsPath}fav.png';
  static const String facebookIcon = '${iconsPath}facebookIcon.png';
  static const String googleIcon = '${iconsPath}googleIcon.png';
  static const String logoIcon = '${iconsPath}logo.png';
  static const String emptyLottie = '${lottiePath}empty.json';
}

class ApiPath {
  static const String login = '${url}login';
  static const String patientSignUp = '${url}patientsignup?';
  static const String docSignUpWithOutClinics = '${url}docsignup?';
  static const String addClinic = '${url}clinics';
  static const String getAllDoctors = '${url}doctorrsdata';
  static const String editDoctorProfile = '${url}doctorupdateprofile';
  static const String editPatientProfile = '${url}patientupdateprofile';
  static const String getPatientAppointments = '${url}getallappointments';
  static const String getDoctorAppointments = '${url}getalldocappointments';
  static const String cancelAppointment = '${url}removeappointment';
  static const String getDoctorClinics = '${url}getdocclinics';
  static const String addNewAppointment = '${url}addappointment';
  static const String getAllRecord = '${url}getallrecords';
  static const String addNewRecord = '${url}addrecord';
  static const String removeRecord = '${url}removerecord';
  static const String editRecord = '${url}editrecord';
  static const String getPatientData = '${url}getpatientbyid';
  static const String rateDoc = '${url}rateadoctor';
  static const String updateClinic = '${url}updateclinic';
  static const String deleteClinic = '${url}deleteclinic';
  static const String getAllAwareness = '${url}articles';
  static const String getSingleAwarenessById = '${url}getarticle?id=';
  static const String addAwareness = '${url}article/write';
}
