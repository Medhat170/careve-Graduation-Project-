import 'package:careve/app/modules/single_doctor/views/add_edit_record_view.dart';
import 'package:get/get.dart';
import 'package:careve/app/modules/appointments_clinics_editing/views/appointments_clinics_editing_view.dart';
import 'package:careve/app/modules/auth/views/auth_view.dart';
import 'package:careve/app/modules/auth/views/doctor_auth.dart';
import 'package:careve/app/modules/auth/views/phone_entry_view.dart';
import 'package:careve/app/modules/auth/views/reset_password_view.dart';
import 'package:careve/app/modules/auth/views/verification_code_view.dart';
import 'package:careve/app/modules/awareness/bindings/awareness_binding.dart';
import 'package:careve/app/modules/awareness/views/add_article_view.dart';
import 'package:careve/app/modules/awareness/views/awareness_view.dart';
import 'package:careve/app/modules/awareness_info/bindings/awareness_info_binding.dart';
import 'package:careve/app/modules/awareness_info/views/awareness_info_view.dart';
import 'package:careve/app/modules/chat/bindings/chat_binding.dart';
import 'package:careve/app/modules/chat/views/chat_view.dart';
import 'package:careve/app/modules/doctors/bindings/doctors_binding.dart';
import 'package:careve/app/modules/doctors/views/doctors_view.dart';
import 'package:careve/app/modules/first_time/bindings/first_time_binding.dart';
import 'package:careve/app/modules/first_time/views/first_time_view.dart';
import 'package:careve/app/modules/home/views/home_view.dart';
import 'package:careve/app/modules/medical_records/bindings/medical_records_binding.dart';
import 'package:careve/app/modules/medical_records/views/medical_records_view.dart';
import 'package:careve/app/modules/patients/bindings/patients_binding.dart';
import 'package:careve/app/modules/patients/views/patients_view.dart';
import 'package:careve/app/modules/rooms/bindings/rooms_binding.dart';
import 'package:careve/app/modules/rooms/views/rooms_view.dart';
import 'package:careve/app/modules/saved/views/saved_view.dart';
import 'package:careve/app/modules/self_checking/bindings/self_checking_binding.dart';
import 'package:careve/app/modules/self_checking/views/self_checking_view.dart';
import 'package:careve/app/modules/settings/bindings/settings_binding.dart';
import 'package:careve/app/modules/settings/views/settings_view.dart';
import 'package:careve/app/modules/single_doctor/bindings/single_doctor_binding.dart';
import 'package:careve/app/modules/single_doctor/views/single_doctor_view.dart';
import 'package:careve/app/modules/splash/bindings/splash_binding.dart';
import 'package:careve/app/modules/splash/views/splash_view.dart';
import 'package:careve/app/modules/user_appointments/bindings/user_appointments_binding.dart';
import 'package:careve/app/modules/user_appointments/views/user_appointments_view.dart';
import 'package:careve/app/modules/user_profile/bindings/user_profile_binding.dart';
import 'package:careve/app/modules/user_profile/views/profile_editing.dart';
import 'package:careve/app/modules/user_profile/views/user_profile_view.dart';
import 'package:careve/app/modules/welcome_screen/bindings/welcome_screen_binding.dart';
import 'package:careve/app/modules/welcome_screen/views/welcome_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.WELCOME_SCREEN,
      page: () => WelcomeScreenView(),
      binding: WelcomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
    ),
    GetPage(
      name: _Paths.DOCTOR_AUTH,
      page: () => DoctorAuthView(),
    ),
    GetPage(
      name: _Paths.PHONE_ENTRY,
      page: () => PhoneEntryView(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
    ),
    GetPage(
      name: _Paths.VERIFICATION_CODE,
      page: () => VerificationCodeView(),
    ),
    GetPage(
      name: _Paths.FIRST_TIME,
      page: () => FirstTimeView(),
      binding: FirstTimeBinding(),
    ),
    GetPage(
      name: _Paths.DOCTORS,
      page: () => DoctorsView(),
      binding: DoctorsBinding(),
    ),
    GetPage(
      name: _Paths.SINGLE_DOCTOR,
      page: () => SingleDoctorView(),
      binding: SingleDoctorBinding(),
    ),
    GetPage(
      name: _Paths.USER_APPOINTMENTS,
      page: () => UserAppointmentsView(),
      binding: UserAppointmentsBinding(),
    ),
    GetPage(
      name: _Paths.SELF_CHECKING,
      page: () => SelfCheckingView(),
      binding: SelfCheckingBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.AWARENESS,
      page: () => AwarenessView(),
      binding: AwarenessBinding(),
    ),
    GetPage(
      name: _Paths.AWARENESS_INFO,
      page: () => AwarenessInfoView(),
      binding: AwarenessInfoBinding(),
    ),
    GetPage(
      name: _Paths.USER_PROFILE,
      page: () => UserProfileView(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => ProfileEditingView(),
    ),
    GetPage(
      name: _Paths.ROOMS,
      page: () => RoomsView(),
      binding: RoomsBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.MEDICAL_RECORDS,
      page: () => MedicalRecordsView(),
      binding: MedicalRecordsBinding(),
    ),
    GetPage(
      name: _Paths.SAVED,
      page: () => SavedView(),
    ),
    GetPage(
      name: _Paths.ADD_AWARENESS,
      page: () => AddAwarenessView(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.PATIENTS,
      page: () => PatientsView(),
      binding: PatientsBinding(),
    ),
    GetPage(
      name: _Paths.APPOINTMENTS_CLINICS_EDITING,
      page: () => AppointmentsClinicsEditingView(),
    ),
    GetPage(
      name: _Paths.ADD_EDIT_RECORD,
      page: () => AddEditRecordView(),
    ),
  ];
}
