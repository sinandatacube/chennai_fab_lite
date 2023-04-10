import 'package:flutter/material.dart';

class QuotationController extends ChangeNotifier {
  DateTime? selectedDate;
  initSelectedDate() {
    selectedDate = null;
    notifyListeners();
  }

  updateSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }
}
