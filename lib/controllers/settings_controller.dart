import 'package:flutter/material.dart';

class SettingsController extends ChangeNotifier {
  bool showChangePassword = false;

  updateTab() {
    showChangePassword = !showChangePassword;
    notifyListeners();
  }
}
