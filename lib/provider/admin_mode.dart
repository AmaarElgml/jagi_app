import 'package:flutter/material.dart';

class AdminMode extends ChangeNotifier {
  bool isAdmin = false;

  updateIsAdmin(bool value) {
    isAdmin = value;
    notifyListeners();
  }
}
