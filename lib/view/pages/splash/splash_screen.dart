import 'package:jagi_app/model/local/cache_helper.dart';
import 'package:jagi_app/view/pages/login/login_screen.dart';
import 'package:jagi_app/view/pages/main/main_screen.dart';
import 'package:jagi_app/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../../constants.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'SplashScreen.id';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () async {
      bool isLogged = CacheHelper.getData(key: kIsLoggedSP) ?? false;
      if (isLogged)
        Navigator.of(context).pushNamedAndRemoveUntil(
            MainScreen.id, (Route<dynamic> route) => false);
      else
        Navigator.of(context).pushNamedAndRemoveUntil(
            LoginScreen.id, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
                child: CircleAvatar(
                    backgroundColor: primaryColor,
                    backgroundImage: AssetImage(appLogo),
                    radius: 120))));
  }
}
