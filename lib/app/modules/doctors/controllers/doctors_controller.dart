import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:careve/app/models/all_doctors.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:get/get.dart';

class DoctorsController extends GetxController
    with CustomAppBar, BusyMixin, ApiMixin {
  final allDoctors = RxList<Doctor>([]);
  final allDoctorsRef = RxList<Doctor>([]);

  Future<void> fetchAllDoctors() async {
    try {
      startBusy();
      final response = await get(ApiPath.getAllDoctors);
      allDoctors(AllDoctors.fromJson(response).data);
      allDoctorsRef.assignAll(allDoctors.toList());
      endBusySuccess();
    } catch (error) {
      endBusyError(
        error,
        showDialog: errorMessage.value != S.current.socketException,
      );
    }
  }

  void search() {
    print('List length : ${allDoctors.length}');
    allDoctors.clear();
    for (final doc in allDoctorsRef) {
      if (doc.name.contains(searchText.text)) {
        allDoctors.add(doc);
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
