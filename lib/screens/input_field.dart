import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Transaction extends GetxController {
  static Transaction get to => Get.find();

  final TextEditingController title = TextEditingController();
  final TextEditingController amount = TextEditingController();
  DateTime? date;
  String? type;

  void setDate(DateTime dateTime) {
    date = dateTime;

    update();
  }

  void changeType(String newType) {
    type = newType;

    update();
  }
}
