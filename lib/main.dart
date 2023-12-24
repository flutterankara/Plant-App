import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:plant/views/catalog_view.dart';
import 'package:plant/views/motion_tab_bar.dart';
import 'views/gunluk_view.dart';

late Box userBox;
Future<void> main() async {
  await Hive.initFlutter();
  userBox = await Hive.openBox("user");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GunlukView(),
    );
  }
}
