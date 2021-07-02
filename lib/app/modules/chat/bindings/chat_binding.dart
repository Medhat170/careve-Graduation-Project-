import 'package:careve/app/modules/chat/controllers/chat_controller.dart';
import 'package:careve/generated/l10n.dart';
import 'package:get/get.dart';

class ChatRouteInputs {
  final int roomId;
  final int receiverID;
  final String roomName;

  ChatRouteInputs({
    this.roomId,
    this.roomName,
    this.receiverID,
  });
}

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    final args = Get.arguments as ChatRouteInputs;
    Get.put(
      ChatController(
        roomId: args?.roomId,
        receiverID: args?.receiverID,
        roomName: args?.roomName ?? S.current.chat,
      ),
    );
  }
}
