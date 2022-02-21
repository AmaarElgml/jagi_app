import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jagi_app/model/local/cache_helper.dart';
import 'package:jagi_app/model/services/auth.dart';
import '../../../constants.dart';
import '../../../model/pojo/user.dart';

class SignUpScreenViewModel {
  final Auth _auth = Auth();
  late String name, email, password;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  Future<UserCredential> register() async {
    return await _auth.register(AppUser(email: email, password: password));
  }

  Future<bool> saveUser() async {
    return await CacheHelper.setData(key: kIsLoggedSP, isLogged: true);
  }
}
