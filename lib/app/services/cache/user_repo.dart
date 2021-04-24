import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
import 'package:careve/app/models/user.dart';

class UserRepo extends ActiveRepo<String, User> {
  @override
  String get boxName => 'users';

  Future<User> updateUserCache(Map<String, dynamic> data) async {
    var local = dataBox.get(data['id'].toString(), defaultValue: User());
    local = User()
      ..name = data['name']
      ..email = data['email']
      ..accessToken = data['apitoken']
      ..image = data['image']
      ..bloodType = data['bloodtype']
      ..address = data['adress']
      ..phone = data['mobile']
      ..id = data['id'].toString()
      ..cv = data['cv']
      ..nationalId = data['nationalid']
      ..cost = data['cost'];
    await dataBox.put(data['id'].toString(), local);
    return local;
  }
}
