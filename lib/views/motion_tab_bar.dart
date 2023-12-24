import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:plant/views/gunluk_view.dart';
import 'package:plant/views/home_view.dart';

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
              // color: Colors.red,
              child: const GunlukView(),
            ),
            Container(
              child: const Center(
                child: HomeView(),
              ),
            ),
            Container(
              // color: Colors.red,
              child: const HomeView(),
            ),
            // IndexedStack(
            //   index: _controller!.index,
            //   children: screens,
            // ),
          ],
          // child: IndexedStack(
          //   index: _controller!.index,
          //   children: screens,
          // ),
        ),
        bottomNavigationBar: MotionTabBar(
          controller: _controller,
          labels: ["Home", "Kategori", "Sepetim", "Arama", "Profil"],
          initialSelectedTab: 'Home',
          tabIconColor: Colors.orange,
          tabSelectedColor: Colors.orange,
          icons: const [
            Icons.home_outlined,
            CupertinoIcons.cube_box,
            Icons.shopping_cart,
            Icons.search,
            Icons.account_circle
          ],
          textStyle: const TextStyle(color: Colors.orange),
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
