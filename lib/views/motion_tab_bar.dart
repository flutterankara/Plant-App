import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:plant/views/diary_view/gunluk_view.dart';
import 'package:plant/views/home_view.dart';
import 'package:plant/views/problem_solution_view/problem_solution_view.dart';

import 'catalog_views/catalog_view.dart';

class MotionTabBarPage extends StatefulWidget {
  MotionTabBarPage({super.key});

  @override
  State<MotionTabBarPage> createState() => _MotionTabBarPageState();
}

class _MotionTabBarPageState extends State<MotionTabBarPage>
    with SingleTickerProviderStateMixin {
  MotionTabBarController? _controller;

  final screens = [
    const HomeView(),
    const CategoriesView(),
    const GunlukView(),
    const HomeView(),
    const ProblemSolutionView(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = MotionTabBarController(
      initialIndex: 0,
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller!.dispose();
  }

  Future<bool> _requestPop() {
    Future.delayed(const Duration(milliseconds: 200), () {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    });

    return new Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        body: TabBarView(
          controller: _controller,
          children: [
            Container(
              // color: Colors.red,
              child: const HomeView(),
            ),
            Container(
              child: const Center(
                child: CategoriesView(),
              ),
            ),
            Container(
              child: const GunlukView(),
            ),
            Container(
              child: const Center(
                child: HomeView(),
              ),
            ),
            Container(
              child: const ProblemSolutionView(),
            ),
          ],
        ),
        bottomNavigationBar: MotionTabBar(
          controller: _controller,
          labels: ["Home", "Categories", "Diary", "Search", "Q/A"],
          initialSelectedTab: 'Home',
          tabIconColor: Colors.blue,
          tabSelectedColor: Colors.blue,
          icons: const [
            Icons.home_outlined,
            CupertinoIcons.cube_box,
            Icons.book_sharp,
            Icons.search,
            Icons.question_answer_outlined
          ],
          textStyle: const TextStyle(color: Colors.blue),
          onTabItemSelected: (int value) {
            setState(() {
              _controller!.index = value;
            });
          },
        ),
      ),
    );
  }
}
