class AllDoctors {
  List<Doctor> data;

  AllDoctors({this.data});

  AllDoctors.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Doctor>[];
      json['data'].forEach((v) {
        data.add(Doctor.fromJson(v));
      });
    }
  }
}

class Doctor {
  int id;
  String name;
  int rating;
  String qualified;
  String image;
  String cost;
  int raters;

  Doctor({
    this.id,
    this.name,
    this.rating,
    this.qualified,
    this.image,
    this.cost,
    this.raters,
  });

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rating = json['rating'];
    qualified = json['qualified'].toString();
    image = json['image'];
    cost = json['cost'].toString();
    raters = json['raters'];
  }
}
