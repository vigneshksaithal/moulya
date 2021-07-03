import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:net_forest/models/account.dart';
import 'package:net_forest/screens/input_field.dart';

import '../style.dart';
import 'add_transaction.dart';
import 'transactions_pie_chart.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: dark,
        title: Text(
          'MOULYA',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 3,
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 400,
          ),
          alignment: Alignment.center,
          width: double.infinity,
          // height: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 12,
          ),
          decoration: BoxDecoration(),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                height: 115,
                child: Card(
                  color: light,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    minVerticalPadding: 34,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Assets',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              GetBuilder<Account>(
                                // init: Account(), // INIT IT ONLY THE FIRST TIME
                                builder: (_) => Text(
                                  '₹ ${_.assetAmount}',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Networth',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            GetBuilder<Account>(
                              // init: Account(), // INIT IT ONLY THE FIRST TIME
                              builder: (_) => Text(
                                '₹ ${_.networth}',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Liabilities',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              GetBuilder<Account>(builder: (_) {
                                return Text(
                                  '₹ ${_.liabilityAmount}',
                                  style: Theme.of(context).textTheme.headline3,
                                );
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 160,
                padding: EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Card(
                        color: light,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        child: GetBuilder<Account>(
                          builder: (_) {
                            double assetPercentage = ((_.assetAmount * 100) /
                                    (_.assetAmount + _.liabilityAmount.abs()))
                                .floorToDouble();
                            double liabilityPercentage = 100 - assetPercentage;

                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Percentage',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Asset: $assetPercentage%',
                                      style: TextStyle(
                                        color: dark,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Liability: $liabilityPercentage%',
                                      style: TextStyle(
                                        color: dark,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: double.infinity,
                        child: Card(
                          color: light,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          child: GetBuilder<Account>(
                            builder: (_) {
                              double asset = _.assetAmount;
                              double liability = _.liabilityAmount;
                              if (_.assetAmount == 0 &&
                                  _.liabilityAmount == 0) {
                                return Center(
                                  child: Text(
                                    'No data available',
                                    style: TextStyle(
                                      color: dark,
                                    ),
                                  ),
                                );
                              } else {
                                return TransactionsPieChart(
                                  asset: asset,
                                  liability: liability,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                  left: 5,
                  top: 15,
                  bottom: 15,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 5,
                      height: 22,
                      decoration: BoxDecoration(
                        color: primary,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Recent Transactions',
                      style: TextStyle(
                        color: dark,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GetBuilder<Account>(
                  init: Account(), // use it only first time on each controller
                  builder: (_) {
                    if (_.transactions.length == 0) {
                      return Container(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Column(
                          children: [
                            Container(
                                height: 150,
                                child: Image.asset(
                                    'assets/images/undraw_empty.png')),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                'No transactions found',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return RecentTransactions();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTransactionScaffold(),
            ),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class RecentTransactions extends StatelessWidget {
  RecentTransactions({
    Key? key,
  }) : super(key: key);

  int listLength = 0;
  int transactionsLength = Account.to.transactions.length;

  int checkTransactionsLength() {
    if (transactionsLength < 5) {
      listLength = transactionsLength;
      return listLength;
    } else {
      transactionsLength = 5;
      return transactionsLength;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: light,
      child: ListView.builder(
        itemCount: checkTransactionsLength(),
        itemBuilder: (context, index) {
          var transactions = Account.to.transactions;
          String type = transactions[index]['type'];
          String sign = '';
          if (type == 'asset') {
            sign = '+';
          } else {
            sign = '-';
          }
          return Card(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${transactions[index]['title']}',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 15,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '$sign ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '₹ ${transactions[index]['amount']}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              subtitle: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: (type == 'asset') ? success : danger,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      '${transactions[index]['type']}',
                      style: TextStyle(
                        color: light,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
