import 'package:jagi_app/model/pojo/admin.dart';

class AdminRolesViewModel {
  final List<Admin> admins = [
    Admin(name: 'Ahmed', image: 'elgml.png', isAdmin: true, isModerator: true),
    Admin(name: 'Fares', image: 'fares.jpeg', isAdmin: false, isModerator: true),
    Admin(name: 'Omar', image: 's3odi.jpeg', isAdmin: false, isModerator: true),
    Admin(name: 'Ahmed', image: 'geka.jpg', isAdmin: false, isModerator: true),
    Admin(name: 'Yousry', image: 'yousry.jpg', isAdmin: false, isModerator: true),
  ];

  void addAdmin() {}
}
