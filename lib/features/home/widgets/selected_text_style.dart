import 'package:flutter/material.dart';

class SelectedTextStyle extends StatelessWidget {
  SelectedTextStyle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey[400],
        ),
      ),
    );
  }
}
