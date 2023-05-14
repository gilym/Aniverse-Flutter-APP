import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  String password;

  @HiveField(1)
  List<int>? favorites;

  UserModel({required this.password,  this.favorites});
}
