import '../../constants.dart';

class AppUser {
  String? id;
  String? name;
  String email;
  String password;

  AppUser({this.id, this.name, required this.email, required this.password});

  AppUser.fromMap(Map<String, dynamic> data)
      : id = data[kUserID],
        name = data[kUserName],
        email = data[kUserEmail],
        password = data[kUserPassword];

  toMap() => {
        kUserID: id,
        kUserName: name,
        kUserEmail: email,
        kUserPassword: password,
      };
}
