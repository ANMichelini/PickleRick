import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoBox extends StatelessWidget {
  InfoBox(this.icon, this.label, this.description);

  final String label;
  final dynamic icon;
  final String description;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
      ),
      width: size.width * 0.44,
      height: size.height * 0.23,
      child: Column(
        children: [
          SizedBox(height: 27),
          FaIcon(
            icon,
            color: Colors.white,
            size: 65,
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            description,
            style: TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 27),
        ],
      ),
    );
  }
}
