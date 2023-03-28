// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker_mobile_flutter/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transaction.map((tx) {
        return Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple, width: 2)),
              child: Text("\$ ${tx.amount}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: Colors.deepPurple)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  DateFormat.yMMMMEEEEd().format(tx.date),
                  style: TextStyle(fontSize: 13, color: Colors.black),
                )
              ],
            )
          ],
        );
      }).toList(),
    );
  }
}
