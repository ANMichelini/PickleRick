import 'package:flutter/material.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.26,
      width: double.infinity,
      color: Colors.purple[100],
      child: Image(
        image: AssetImage('assets/rickymortyimage.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }
}
