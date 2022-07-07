import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';

class HeadlineButton extends StatelessWidget {
  HeadlineButton(
      {required this.text, required this.pageController, required this.index});
  final String text;
  final PageController pageController;
  final int index;

  @override
  Widget build(BuildContext context) {
    final appProv = Provider.of<AppProvider>(context);

    return GestureDetector(
      onTap: () async {
        appProv.selectedButton = index;
        await pageController.animateToPage(
          index,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeIn,
        );
      },
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 10, top: 10, left: 15, right: 15),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: (appProv.selectedButton == index)
                ? Colors.purple
                : Colors.grey[400],
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
