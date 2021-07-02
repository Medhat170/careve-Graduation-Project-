class MessageData {
  Message messageData;

  MessageData({this.messageData});

  MessageData.fromJson(Map<String, dynamic> json) {
    messageData = json['data'] != null ? Message.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (messageData != null) {
      data['data'] = messageData.toJson();
    }
    return data;
  }
}

class AllMessages {
  List<Message> allMessages;

  AllMessages({this.allMessages});

  AllMessages.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      allMessages = <Message>[];
      json['data'].forEach((v) {
        allMessages.add(Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (allMessages != null) {
      data['data'] = allMessages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  String messagesText;
  int userId;
  String receiverType;
  String receiverId;
  String file;
  String conid;
  DateTime updatedAt;
  String createdAt;
  int id;

  Message({
    this.messagesText,
    this.userId,
    this.receiverType,
    this.receiverId,
    this.file,
    this.conid,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  Message.fromJson(Map<String, dynamic> json) {
    messagesText = json['messages'];
    userId = json['user_id'];
    receiverType = json['receiver_type'];
    receiverId = json['receiver_id'].toString();
    file = json['file'];
    conid = json['conid'];
    updatedAt = DateTime.tryParse(json['updated_at'].toString());
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['messages'] = messagesText;
    data['user_id'] = userId;
    data['receiver_type'] = receiverType;
    data['receiver_id'] = receiverId;
    data['file'] = file;
    data['conid'] = conid;
    data['updated_at'] = updatedAt.toString();
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
