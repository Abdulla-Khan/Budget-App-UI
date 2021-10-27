// ignore_for_file: prefer_const_constructors

import 'package:budget_app/data/data.dart';
import 'package:budget_app/widgets/bar_chart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            }, childCount: 9),
          ),
        ],
      ),
    );
  }
}
