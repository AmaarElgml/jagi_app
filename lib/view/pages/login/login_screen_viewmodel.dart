import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jagi_app/model/local/cache_helper.dart';
import 'package:jagi_app/model/pojo/user.dart';
import 'package:jagi_app/model/services/auth.dart';
import '../../../constants.dart';

class LoginScreenViewModel {
  final Auth _auth = Auth();
  late String email, password;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  Future<UserCredential> login() async {
    return await _auth.login(AppUser(email: email, password: password));
  }

  Future<bool> saveUser() async {
    return await CacheHelper.setData(key: kIsLoggedSP, isLogged: true);
  }
}
