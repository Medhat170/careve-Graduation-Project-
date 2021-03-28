import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
import 'package:careve/app/models/user.dart';
import 'package:get/get.dart';

class UserRepo extends ActiveRepo<String, User> {
  @override
  String get boxName => 'users';

  static User updateUserCache(Map<String, dynamic> data) {
    return User()
      ..name = data['name']
      ..email = data['email']
      ..accessToken = data['apitoken']
      ..image = data['image']
      ..bloodType = data['bloodtype']
      ..address = data['adress']
      ..phone = data['mobile']
      ..id = data['id'].toString();
  }
}
