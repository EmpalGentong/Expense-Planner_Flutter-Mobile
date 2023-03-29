// ignore_for_file: prefer_const_constructors, duplicate_ignore, unnecessary_brace_in_string_interps
import 'package:expense_tracker_mobile_flutter/widgets/transaction_list.dart';

import './widgets/new_transaction.dart';
import './models/transaction.dart';

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
  final List<Transaction> _userTransaction = [
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
      _userTransaction.add(newTX);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTX);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(Icons.add))
        ],
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
          TransactionList(_userTransaction),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
