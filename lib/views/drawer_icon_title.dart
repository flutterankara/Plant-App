import 'package:flutter/material.dart';

class DrawerIconAndTitle extends StatelessWidget {
  DrawerIconAndTitle({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String? title;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Text(
              title!,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
