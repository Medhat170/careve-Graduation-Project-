class AllRooms {
  List<Room> rooms;

  AllRooms({this.rooms});

  AllRooms.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      rooms = <Room>[];
      json['data'].forEach((v) {
        rooms.add(Room.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rooms != null) {
      data['data'] = rooms.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Room {
  int id;
  String name;
  String lastm;
  String receiverName;
  int receiverId;
  String createdAt;
  DateTime updatedAt;

  Room({
    this.id,
    this.name,
    this.lastm,
    this.receiverName,
    this.receiverId,
    this.createdAt,
    this.updatedAt,
  });

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastm = json['lastm'];
    receiverName = json['receiver_name'];
    receiverId = json['receiver_id'];
    createdAt = json['created_at'];
    updatedAt = DateTime.tryParse(json['updated_at'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['lastm'] = lastm;
    data['receiver_name'] = receiverName;
    data['receiver_id'] = receiverId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt.toString();
    return data;
  }
}
