import 'package:flutter/material.dart';
import 'package:plant/views/login/login_view.dart';

import 'drawer_icon_title.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
// List<int> _gonderilecekFirmaId = [];

  @override
  void initState() {
// TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
            height: 275,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Alperen Göyce",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          DrawerIconAndTitle(
            title: 'İmza Bekleyenler',
            onTap: () async {},
          ),
          Divider(),
          const SizedBox(
            height: 20,
          ),
          DrawerIconAndTitle(
            title: 'İmzaladıklarım',
            onTap: () async {},
          ),
          Divider(),
          const SizedBox(
            height: 20,
          ),
          DrawerIconAndTitle(
            title: 'Bildirimler',
            onTap: () async {},
          ),
          Divider(),
          const SizedBox(
            height: 20,
          ),
          DrawerIconAndTitle(
            title: 'Mesajlar',
            onTap: () async {},
          ),
          const SizedBox(
            height: 160,
          ),
          DrawerIconAndTitle(
            title: 'Çıkış',
            onTap: () async {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Oturumunuz kapatılmıştır')));

              Navigator.pop(context);

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
