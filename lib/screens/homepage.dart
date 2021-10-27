// ignore_for_file: prefer_const_constructors

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
            leading: IconButton(
              icon: Icon(
                Icons.settings_outlined,
                size: 30,
              ),
              onPressed: () {},
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Budget App"),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                height: 100,
                color: Colors.red,
              );
            }, childCount: 10),
          ),
        ],
      ),
    );
  }
}
