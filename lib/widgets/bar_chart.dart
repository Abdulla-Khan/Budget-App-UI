import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  const BarChart(this.expenses);
  final List<double> expenses;
  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    for (var price in expenses) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    }
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const Text(
            "Weekly Spending",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 20,
                ),
                onPressed: () {},
              ),
              const Text(
                "Nov 1,2021 - Nov 7,2021",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2),
              ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_forward,
                  size: 20,
                ),
                onPressed: () {},
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Bar("Sun", expenses[6], mostExpensive),
                Bar("Mon", expenses[0], mostExpensive),
                Bar("Tue", expenses[1], mostExpensive),
                Bar("Wed", expenses[2], mostExpensive),
                Bar("Thur", expenses[3], mostExpensive),
                Bar("Fri", expenses[4], mostExpensive),
                Bar("Sat", expenses[5], mostExpensive)
              ])
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpense;
  final double _maxBar = 150;

  const Bar(this.label, this.amountSpent, this.mostExpense);

  @override
  Widget build(BuildContext context) {
    final BarHeight = amountSpent / mostExpense * _maxBar;
    return Column(
      children: [
        Text("\$${amountSpent.toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            )),
        SizedBox(
          height: 8,
        ),
        Container(
          height: BarHeight,
          width: 18,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(16)),
        ),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ],
    );
  }
}
