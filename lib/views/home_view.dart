import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'drawer_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<int> list = [
    1,
    2,
    3,
    4,
    1,
    2,
    3,
    4,
    1,
    2,
    3,
    4,
    1,
    2,
    3,
    4,
    1,
    2,
    3,
    4,
    1,
    2,
    3,
    4,
    1,
    2,
    3,
    4,
    1,
    2,
    3,
    4,
    1,
    2,
    3,
    4,
    1,
    2,
    3,
    4,
    1,
    2,
    3,
    4,
    1,
    2,
    3,
    4,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      drawer: const DrawerScreen(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Home View"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                int i = list[index];

                return Card(
                  child: Container(
                      height: context.sized.dynamicHeight(0.2),
                      color: Colors.green,
                      child: Center(child: Text("${i}"))),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
