class AllRecords {
  List<Record> data;

  AllRecords({
    this.data,
  });

  AllRecords.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Record>[];
      json['data'].forEach((v) {
        data.add(Record.fromJson(v));
      });
    }
  }
}

class Record {
  int id;
  String name;
  String result;
  String resultImage;
  int patientId;
  DateTime updatedAt;

  Record({
    this.id,
    this.name,
    this.result,
    this.resultImage,
    this.patientId,
    this.updatedAt,
  });

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    result = json['result'];
    resultImage = json['resultasimage'];
    patientId = int.tryParse(json['patientid'].toString());
    updatedAt = DateTime.parse(json['updated_at'].toString());
  }
}
