import 'package:budget_app/models/category_models.dart';
import 'package:budget_app/models/expense_model.dart';
import 'package:budget_app/widgets/radial_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'colors/colorhelper.dart';

class CategoryScreen extends StatefulWidget {
  final Category cat;
  CategoryScreen({required this.cat});
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  double total = 0;

  @override
  Widget build(BuildContext context) {
    widget.cat.expenses.forEach((Expense ex) {
      total += ex.cost;
    });
    final double amountleft = widget.cat.maxAmount - total;
    final double percent = amountleft / widget.cat.maxAmount;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cat.name),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                size: 30,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 6,
                      ),
                    ]),
                child: CustomPaint(
                  foregroundPainter: Radial(
                      bgcolor: Colors.grey.shade200,
                      lineColor: getColor(context, percent),
                      percent: percent,
                      width: 15),
                  child: Center(
                    child: Text(
                      "\$${amountleft.toStringAsFixed(2)}/ \$${widget.cat.maxAmount}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )),
            _buildExpenses(),
          ],
        ),
      ),
    );
  }

  _buildExpenses() {
    List<Widget> expense = [];
    widget.cat.expenses.forEach((Expense ex) {
      expense.add(Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 6,
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ex.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$${ex.cost.toStringAsFixed(2)}",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ));
    });
    return Column(children: expense);
  }
}
