import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';
import '../widgets/card_swiper.dart';
import '../widgets/character_grid.dart';

class GalleryScreen extends StatelessWidget {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final appProv = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor:
          (appProv.isSwitched) ? Colors.grey[850] : Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: FadeInLeft(
          duration: Duration(milliseconds: 500),
          child: Text(
            'Rick And Morty',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: FutureBuilder(
        future: appProv.fetchAllCharacters(),
        builder: (context, snapshot) {
          return RawScrollbar(
            thumbColor: Colors.white,
            radius: Radius.circular(15.0),
            thickness: 8.0,
            minThumbLength: 50.0,
            interactive: true,
            isAlwaysShown: true,
            controller: scrollController,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              controller: scrollController,
              child: Column(
                children: [
                  CardSwiper(),
                  Text(
                    '826 Characters',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 40900,
                    child: CharacterGrid(
                      onNextPage: () => appProv.allCharacters,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
