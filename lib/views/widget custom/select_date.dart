import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/quotation_controller.dart';

class SelectDate {
  // /\/\/\/\/\/\\\/\//\ select date
  Future<DateTime?> selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      context.read<QuotationController>().updateSelectedDate(picked);
      return picked;
    } else {
      return selectedDate;
    }
  }
}
