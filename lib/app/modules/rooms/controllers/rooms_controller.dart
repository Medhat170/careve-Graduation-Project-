import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:careve/app/models/all_rooms.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:get/get.dart';

class RoomsController extends GetxController with BusyMixin, ApiMixin {
  final allRomes = RxList<Room>(<Room>[]);

  Future<void> fetchRooms() async {
    try {
      startBusy();
      final response = await get(
        ApiPath.getAllRooms,
      );
      if (response['data'] != null) {
        allRomes.assignAll(AllRooms.fromJson(response).rooms);
      }
      endBusySuccess();
    } catch (error) {
      endBusyError(
        error,
        showDialog: errorMessage.value != S.current.socketException,
      );
    }
  }

  @override
  void onReady() {
    fetchRooms();
    super.onReady();
  }
}
