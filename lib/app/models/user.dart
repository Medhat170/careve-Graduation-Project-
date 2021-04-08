import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
import 'package:careve/app/services/cache/hive_type_ids.dart';

part 'user.g.dart';

@HiveType(typeId: userTypeId)
class User {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String phone;

  @HiveField(3)
  String email;

  @HiveField(4)
  String image;

  @HiveField(5)
  String accessToken;

  @HiveField(6)
  String bloodType;

  @HiveField(7)
  String address;

  @HiveField(8)
  DateTime dateOfBirth;
}
