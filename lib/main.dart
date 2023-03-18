// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:expense_tracker_mobile_flutter/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budgeting app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Budget Expense Planner'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'sepatu', amount: 100, date: DateTime.now()),
    Transaction(id: 't2', title: 'baju', amount: 200.50, date: DateTime.now()),
    Transaction(id: 't3', title: 'sepatu', amount: 450, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Card(
            color: Colors.blue,
            elevation: 5,
            // ignore: prefer_const_constructors, sized_box_for_whitespace
            child: Text('CHART!'),
          ),
          Column(
            children: transactions.map((tx) {
              return Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepPurple, width: 2)),
                    child: Text("${tx.amount} usd",
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(
                        tx.date.toString(),
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      )
                    ],
                  )
                ],
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
