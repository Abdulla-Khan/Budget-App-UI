// ignore_for_file: prefer_const_constructors

import 'package:budget_app/data/data.dart';
import 'package:budget_app/models/category_models.dart';
import 'package:budget_app/models/expense_model.dart';
import 'package:budget_app/widgets/bar_chart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _buildCategory(Category category, double totalAmount) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.black12, offset: Offset(0, 2), blurRadius: 6.0)
        ],
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              category.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              "\$${(category.maxAmount - totalAmount).toStringAsFixed(2)}/\$${category.maxAmount}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            )
          ])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            expandedHeight: 100.0,
            forceElevated: true,
            pinned: true,
            leading: IconButton(
              icon: Icon(Icons.settings),
              iconSize: 30,
              onPressed: () {},
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Simple Budget"),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
                iconSize: 30,
              )
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, index) {
              if (index == 0) {
                return Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6)
                    ],
                  ),
                  child: BarChart(weeklySpending),
                );
              } else {
                final Category category = categories[index - 1];
                double totalAmount = 0;
                category.expenses.forEach((Expense expense) {
                  totalAmount += expense.cost;
                });
                return _buildCategory(category, totalAmount);
              }
            }, childCount: 1 + categories.length),
          ),
        ],
      ),
    );
  }
}
