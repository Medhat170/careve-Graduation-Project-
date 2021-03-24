import 'package:careve/App_Sections.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import 'App_Sections.dart';

const App_Sections_Data = const [
  AppSections(
    name: 'Forum',
    id: 'F1',
    image: PathUtil.forumImage,
  ),
  AppSections(
      name: 'Nearby Hospitals',
      id: 'NH1',
      image: PathUtil.nearbyHospitalsImage),
  AppSections(
    name: 'Self Checking',
    id: 'SC1',
    image: PathUtil.selfCheckingImage,
  ),
  AppSections(
    name: 'Doctors',
    id: 'D1',
    image: PathUtil.doctorsImage,
  ),
  AppSections(
    name: 'Notes',
    id: 'N1',
    image: PathUtil.notesImage,
  ),
  AppSections(
    name: 'Self Care',
    id: 'sc1',
    image: PathUtil.selfCareImage,
  ),
];
