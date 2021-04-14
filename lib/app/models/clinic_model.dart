class UserClinics {
  List<Clinic> clinics;

  UserClinics({
    this.clinics,
  });

  UserClinics.fromJson(Map<String, dynamic> json) {
    if (json['clinics'] != null) {
      clinics = <Clinic>[];
      json['clinics'].forEach((v) {
        clinics.add(new Clinic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clinics != null) {
      data['clinics'] = this.clinics.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Clinic {
  String phone;
  Address address;
  List<Day> days;

  Clinic({
    this.phone,
    this.address,
    this.days,
  });

  Clinic.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    if (json['days'] != null) {
      days = <Day>[];
      json['days'].forEach((v) {
        days.add(new Day.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    if (this.days != null) {
      data['days'] = this.days.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  String title;
  String formattedAddress;
  double lat;
  double long;

  Address({
    this.title,
    this.formattedAddress,
    this.lat,
    this.long,
  });

  Address.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    formattedAddress = json['formatted_address'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['formatted_address'] = this.formattedAddress;
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}

class Day {
  int status;
  String day;
  DateTime startTime;
  DateTime endTime;

  Day({
    this.status,
    this.day,
    this.startTime,
    this.endTime,
  });

  Day.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    day = json['day'];
    startTime = DateTime.parse(json['start_time']);
    endTime = DateTime.parse(json['end_time']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['day'] = this.day;
    data['start_time'] = this.startTime.toUtc().toString();
    data['end_time'] = this.endTime.toUtc().toString();
    return data;
  }
}
