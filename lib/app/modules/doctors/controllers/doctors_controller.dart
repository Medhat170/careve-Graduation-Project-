import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:careve/app/models/all_doctors.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:get/get.dart';

class DoctorsController extends GetxController
    with CustomAppBar, BusyMixin, ApiMixin {
  final allDoctors = RxList<Doctor>([]);
  final allDoctorsRef = RxList<Doctor>([]);

  Future<void> fetchAllDoctors() async {
    try {
      startBusy();
      final response = await get(
        url: ApiPath.getAllDoctors,
      );
      allDoctors(AllDoctors.fromJson(response).data);
      allDoctorsRef(allDoctors);
    } catch (error) {
      await AppUtil.showAlertDialog(body: error.toString());
    }
    endBusySuccess();
  }

  void search() {
    print('List length : ${allDoctors.length}');
    allDoctors.clear();
    for (final doc in allDoctorsRef) {
      if (doc.name.contains(searchText.text)) {
        allDoctors.assign(doc);
      }
    }
  }

  @override
  void onReady() {
    fetchAllDoctors();
    onDebounce(search);
    super.onReady();
  }

  @override
  void onClose() {
    searchText.dispose();
    super.onClose();
  }
}
