import 'package:careve/app/modules/chat/controllers/chat_controller.dart';
import 'package:careve/generated/l10n.dart';
import 'package:get/get.dart';

class ChatRouteInputs {
  final int roomId;
  final String roomName;

  ChatRouteInputs({
    this.roomId,
    this.roomName,
  });
}

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    var args = Get.arguments as ChatRouteInputs;
    Get.lazyPut(
      () => ChatController(
        roomId: args.roomId,
        roomName: args.roomName ?? S.current.chat,
      ),
    );
  }
}
