import 'package:flutter/material.dart';

class ModelHUD extends ChangeNotifier {
  bool isLoading = false;

  updateIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
