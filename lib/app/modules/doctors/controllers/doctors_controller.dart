import 'package:careve/app/mixins/search_mixin.dart';
import 'package:careve/app/models/doctor.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import 'package:get/get.dart';

class DoctorsController extends GetxController with Search {
  List<Doctor> doctors = [
    Doctor(
      name: 'Dr. Mayme Gomez',
      id: 'Dr1',
      specialty: 'Breast tumors',
      image: PathUtil.doctorImage,
    ),
    Doctor(
      name: 'Dr. Mayme Gomez',
      id: 'Dr2',
      specialty: 'Breast tumors',
      image: PathUtil.doctorImage,
    ),
    Doctor(
      name: 'Dr. Mayme Gomez',
      id: 'Dr3',
      specialty: 'Breast tumors',
      image: PathUtil.doctorImage,
    ),
    Doctor(
      name: 'Dr. Mayme Gomez',
      id: 'Dr4',
      specialty: 'Breast tumors',
      image: PathUtil.doctorImage,
    ),
    Doctor(
      name: 'Dr. Mayme Gomez',
      id: 'Dr5',
      specialty: 'Breast tumors',
      image: PathUtil.doctorImage,
    ),
    Doctor(
      name: 'Dr. Mayme Gomez',
      id: 'Dr6',
      specialty: 'Breast tumors',
      image: PathUtil.doctorImage,
    ),
  ];
  @override
  void onClose() {
    print('::::::::::::::::' + searchText.text);
    super.onClose();
  }
}
