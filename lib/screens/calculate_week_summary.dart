import 'package:get/get.dart';
import 'package:net_forest/models/account.dart';

class CalculateWeekSummary extends GetxController {
  DateTime dateTime = DateTime.now();
  List<Map<String, dynamic>> weekTransactions = [
    {
      'day': 'sunday',
      'assetAmount': 500,
      'liabilityAmount': 100,
    }
  ];

  calculateSummary() {
    int i = 0;

    List<Map<String, dynamic>> transactions = Account.to.transactions;

    transactions.forEach((element) {
      for (i = 0; i < 7;) {
        if (element['timestamp'] == DateTime.now().add(Duration(days: i))) {
          weekTransactions.add({
            'day': element['timestamp'],
          });
        }
        ;
      }
    });
  }
}
