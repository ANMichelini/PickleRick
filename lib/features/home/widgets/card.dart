import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: Container(
        width: size.width * 0.42,
        height: 50,
        color: Colors.purple[400],
        child: Row(
          children: [
            Spacer(),
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.arrow_forward_ios_rounded,
                color: Colors.white, size: 12),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
