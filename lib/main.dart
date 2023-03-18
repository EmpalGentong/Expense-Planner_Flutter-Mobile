// ignore_for_file: prefer_const_constructors, duplicate_ignore, unnecessary_brace_in_string_interps

import 'package:expense_tracker_mobile_flutter/transaction.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

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

  // late String titleInput;
  // late String amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Card(
            color: Colors.blue,
            elevation: 5,
            // ignore: prefer_const_constructors, sized_box_for_whitespace
            child: Text('CHART!'),
          ),
          Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titleController,
                      // onChanged: (value) {
                      //   titleInput = value;
                      // },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountController,
                      // onChanged: (value) {
                      // amountInput = value;
                      // },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print(
                            "${titleController.text} // ${amountController.text}");
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber),
                      child: Text('Add'),
                    )
                  ],
                ),
              )),
          Column(
            children: transactions.map((tx) {
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
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
          )
        ],
      ),
    );
  }
}
