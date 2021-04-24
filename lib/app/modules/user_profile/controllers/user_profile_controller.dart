import 'package:careve/app/models/user.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  final userData = Rx<User>();

  static UserProfileController get to => Get.find();

  @override
  void onReady() {
    userData.value = AuthService.to.user?.value;
    AuthService.to.name.text = userData?.value?.name;
    AuthService.to.email.text = userData?.value?.email;
    AuthService.to.phone.text = userData?.value?.phone;
    AuthService.to.address.text = userData?.value?.address;
    AuthService.to.nationalId.text = userData?.value?.nationalId;
    AuthService.to.cost.text = userData?.value?.cost;
    AuthService.to.dateOfBirth(userData?.value?.dateOfBirth);
    AuthService.to.bloodType(userData?.value?.bloodType);
    AuthService.to.image(userData?.value?.image);
    super.onReady();
  }
}
