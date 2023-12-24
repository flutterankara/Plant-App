import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:plant/views/motion_tab_bar.dart';
import 'package:provider/provider.dart';

import 'core/auth_manager.dart';

late Box userBox;
Future<void> main() async {
  await Hive.initFlutter();
  userBox = await Hive.openBox("user");
  runApp(MultiProvider(providers: [
    Provider<AuthenticationManager>(
      create: (context) => AuthenticationManager(context: context),
      lazy: true,
    )
  ], child: MyApp()));
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
      home: MotionTabBarPage(),
    );
  }
}
