class UserClinics {
  List<Clinic> clinics;

  UserClinics({
    this.clinics,
  });

  UserClinics.fromJson(Map<String, dynamic> json) {
    if (json['clinics'] != null) {
      clinics = <Clinic>[];
      json['clinics'].forEach((Map<String, dynamic> v) {
        clinics.add(Clinic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (clinics != null) {
      data['clinics'] = clinics.map((v) => v.toJson()).toList();
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
    phone = json['phone'].toString();
    address = json['address'] != null
        ? Address.fromJson(json['address'] as Map<String, dynamic>)
        : null;
    if (json['days'] != null) {
      days = <Day>[];
      json['days'].forEach((Map<String, dynamic> v) {
        days.add(Day.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    if (address != null) {
      data['address'] = address.toJson();
    }
    if (days != null) {
      data['days'] = days.map((v) => v.toJson()).toList();
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
    title = json['title'].toString();
    formattedAddress = json['formatted_address'].toString();
    lat = double.tryParse(json['lat'].toString());
    long = double.tryParse(json['long'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['formatted_address'] = formattedAddress;
    data['lat'] = lat;
    data['long'] = long;
    return data;
  }
}

class Day {
  int status;
  String day;
  String startTime;
  String endTime;

  Day({
    this.status,
    this.day,
    this.startTime,
    this.endTime,
  });

  Day.fromJson(Map<String, dynamic> json) {
    status = int.tryParse(json['status'].toString());
    day = json['day'].toString();
    startTime = json['start_time'].toString();
    endTime = json['end_time'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['day'] = day;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    return data;
  }
}
