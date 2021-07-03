import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:net_forest/models/account.dart';
import 'package:net_forest/screens/homepage.dart';
import 'package:net_forest/screens/input_field.dart';
import 'package:net_forest/style.dart';

// ignore: must_be_immutable
class AddTransactionScaffold extends StatelessWidget {
  AddTransactionScaffold({Key? key}) : super(key: key);

  final Transaction transaction = Get.put(Transaction());

  String? type = Transaction.to.type;
  TextEditingController? _title = Transaction.to.title;
  TextEditingController _amount = Transaction.to.amount;
  DateTime? _date = Transaction.to.date;
  final _formKey = GlobalKey<FormState>();

  Future datePicker(BuildContext context) async {
    final initialDate = DateTime.now();

    DateTime? _selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(initialDate.year - 5),
      lastDate: DateTime(initialDate.year + 5),
    );

    if (_selectedDate == null) return;

    _date = _selectedDate;
    Transaction.to.setDate(_selectedDate);

    print('${DateTime.now()} $_selectedDate');

    // _date = DateTime.now();
  }

  void clearInputFields() {
    _title!.text = '';
    _amount.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: light,
        appBar: AppBar(
          title: Text('Add Transaction'),
          centerTitle: true,
          backgroundColor: dark,
        ),
        body: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(
                // horizontal: 40,
                // vertical: 25,
                ),
            child: Column(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 30,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: GetBuilder<Transaction>(
                                builder: (_) => ElevatedButton(
                                  child: Text('Asset'),
                                  onPressed: () {
                                    _.changeType('asset');
                                    print('$type ${_.type}');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                    primary: (_.type == 'asset')
                                        ? Colors.indigoAccent
                                        : light,
                                    onPrimary: (_.type == 'asset')
                                        ? Colors.white
                                        : Colors.black54,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                        width: 2,
                                        color: (_.type != 'asset')
                                            ? dark
                                            : Colors.indigoAccent,
                                      ),
                                    ),
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: GetBuilder<Transaction>(
                                builder: (_) => ElevatedButton(
                                  child: Text('Liability'),
                                  onPressed: () {
                                    _.changeType('liability');

                                    type = 'liability';
                                    print('$type ${_.type}');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                    primary: (_.type == 'liability')
                                        ? Colors.indigoAccent
                                        : light,
                                    onPrimary: (_.type == 'liability')
                                        ? Colors.white
                                        : Colors.black54,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        5,
                                      ),
                                      side: BorderSide(
                                        width: 2,
                                        color: (_.type != 'liability')
                                            ? dark
                                            : Colors.indigoAccent,
                                      ),
                                    ),
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Date',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            GetBuilder<Transaction>(
                              builder: (_) => TextButton(
                                child: Text(
                                  '${_.date?.day ?? 'dd'} / ${_.date?.month ?? 'mm'} / ${_.date?.year ?? 'yyyy'}',
                                  style: TextStyle(
                                    color: TextColor().light,
                                    fontSize: 18,
                                  ),
                                ),
                                onPressed: () {
                                  datePicker(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  primary: Colors.grey[500],
                                  onPrimary: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          controller: _title,
                          decoration: InputDecoration(
                            hintText: 'Title',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some title';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: _amount,
                          decoration: InputDecoration(
                            hintText: 'Amount',
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Amount cannot be empty. Please enter amount.';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 25,
                  ),
                  color: Colors.grey[300],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          child: Text('CANCEL'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      GetBuilder<Transaction>(builder: (_) {
                        return Expanded(
                          child: ElevatedButton(
                            child: Text(
                              'ADD',
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await Account.to.addTransaction(
                                  _.type!,
                                  _.title.text,
                                  _.date,
                                  double.parse(_.amount.text),
                                );

                                final snackBar = SnackBar(
                                  // backgroundColor: light,
                                  content:
                                      Text('Transaction added successfully!'),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);

                                Navigator.pop(context);

                                clearInputFields();
                              }
                            },
                          ),
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
    );
  }
}
