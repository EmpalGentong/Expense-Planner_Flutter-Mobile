import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> userTransaction = [
    Transaction(id: 't1', title: 'sepatu', amount: 100, date: DateTime.now()),
    Transaction(id: 't2', title: 'baju', amount: 200.50, date: DateTime.now()),
    Transaction(id: 't3', title: 'sepatu', amount: 450, date: DateTime.now()),
  ];

  void _addNewTX(String txName, double txAmount) {
    final newTX = Transaction(
        id: DateTime.now().toString(),
        title: txName,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      userTransaction.add(newTX);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTX),
        TransactionList(userTransaction),
      ],
    );
  }
}
