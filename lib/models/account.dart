import 'package:get/get.dart';

class Account extends GetxController {
  static Account get to => Get.find();

  double assetAmount = 0, liabilityAmount = 0, networth = 0;

  List<Map<String, dynamic>> transactions = [];

  List weeklyTransactions = [
    10,
    20,
    30,
  ];

  void addTransaction(
      String type, String? title, DateTime? dateTime, double amount) {
    transactions.add({
      'type': type,
      'title': title,
      'timestamp': dateTime,
      'amount': amount,
    });

    if (type == 'asset') {
      addAsset(amount);
    } else if (type == 'liability') {
      addLiability(amount);
    }

    update();
  }

  void addAsset(double amount) {
    assetAmount += amount;

    calculateNetworth();

    update();
  }

  void addLiability(double amount) {
    liabilityAmount -= amount;

    calculateNetworth();

    update();
  }

  void calculateNetworth() {
    networth = assetAmount + liabilityAmount;

    update();
  }
}
