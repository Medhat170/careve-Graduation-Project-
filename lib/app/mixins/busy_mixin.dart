import 'package:careve/app/utilities/appUtil.dart';
import 'package:get/get.dart';

mixin BusyMixin {
  final isBusy = false.obs;
  final errorMessage = Rx<String>();
  bool get hasError =>
      errorMessage.value != null && errorMessage.value.isNotEmpty;

  void startBusy() {
    isBusy(true);
    errorMessage.nil();
  }

  void endBusySuccess() {
    isBusy(false);
    errorMessage.nil();
  }

  void endBusyError(Object error, {bool showDialog}) {
    isBusy(false);
    String message = error is String ? error : error?.toString();
    errorMessage(message);
    if (showDialog == true) {
      AppUtil.showAlertDialog(body: message);
    }
  }
}
