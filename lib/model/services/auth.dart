import 'package:firebase_auth/firebase_auth.dart';
import 'package:jagi_app/model/pojo/user.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential> register(AppUser user) async {
    final result = await _auth.createUserWithEmailAndPassword(email: user.email, password: user.password);
    return result;
  }

  Future<UserCredential> login(AppUser user) async {
    final result = await _auth.signInWithEmailAndPassword(email: user.email, password: user.password);
    return result;
  }

  String currentUserID() {
    return _auth.currentUser!.uid;
  }

  User getUser() {
    return _auth.currentUser!;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
