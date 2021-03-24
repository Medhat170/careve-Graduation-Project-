import 'package:careve/app/models/section.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Section> sections = [
    Section(
      name: 'Forum',
      id: 'F1',
      image: PathUtil.forumImage,
    ),
    Section(
      name: 'Nearby Hospitals',
      id: 'NH1',
      image: PathUtil.nearbyHospitalsImage,
    ),
    Section(
      name: 'Self Checking',
      id: 'SC1',
      image: PathUtil.selfCheckingImage,
    ),
    Section(
      name: 'Doctors',
      id: 'D1',
      image: PathUtil.doctorsImage,
    ),
    Section(
      name: 'Notes',
      id: 'N1',
      image: PathUtil.notesImage,
    ),
    Section(
      name: 'Self Care',
      id: 'sc1',
      image: PathUtil.selfCareImage,
    ),
  ];
}
