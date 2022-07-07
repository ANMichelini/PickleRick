import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';
import '../../../widgets/circle_avatar.dart';
import '../../detail/screens/character_screen.dart';

class CharacterGrid extends StatefulWidget {
  final Function onNextPage;

  const CharacterGrid({Key? key, required this.onNextPage}) : super(key: key);

  @override
  State<CharacterGrid> createState() => _CharacterGridState();
}

class _CharacterGridState extends State<CharacterGrid> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(
      () {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 500) {
          widget.onNextPage();
        }
      },
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appProv = Provider.of<AppProvider>(context);

    return GridView.builder(
      controller: scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 20.0,
      ),
      padding: EdgeInsets.only(top: 20),
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: appProv.allCharacters.length,
      itemBuilder: (_, int index) => Column(
        children: [
          CircleAvatarWidget(
            radius: 40,
            image: appProv.allCharacters[index].image,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CharacterScreen(),
                  settings: RouteSettings(
                    arguments: appProv.allCharacters[index],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 5),
          Container(
            width: 100,
            height: 42,
            child: Text(
              appProv.allCharacters[index].name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
