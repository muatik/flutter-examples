import 'package:costOfLiving/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  double totalCost;
  List<Transaction> transactions;
  
  Chart(List<Transaction> transactions) {
    this.transactions = transactions;
    totalCost = transactions.fold(0, (prev, entry) => prev + entry.amount);
  }

  int getTotalByDay(String day) {
    return transactions
      .where((t) => DateFormat('E').format(t.date).toString() == day)
      .map((t) => t.amount)
      .fold(0, (prev, current) => prev + current);
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColorDark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ...List.generate(7, (index) {
          var day = DateFormat('E').format(DateTime.now().subtract(
            Duration(days: 6-index))).toString();
          return buildChartBar(color, day, getTotalByDay(day) / totalCost);
        })
      ],
    );
  }

  Widget buildChartBar(Color color, String day, double percentage) {
    return Column(
      children: [
        Text(day),
        SizedBox(
          width: 30, 
          height: 80, 
          child: FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: percentage,
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(3)
              ),
            ),
          )
        ),
      ]
    );
  }
}