import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_app/models/character.dart';
import 'package:new_app/provider/provider.dart';
import 'package:provider/provider.dart';

class CharacterSearchDelegate extends SearchDelegate {
  final String route;

  CharacterSearchDelegate(this.route);
  @override
  String get searchFieldLabel => 'Search characters';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final appProv = Provider.of<AppProvider>(context, listen: false);
    appProv.getSuggestionsByQuery(query);

    return StreamBuilder(
      stream: appProv.suggestionStream,
      builder: (_, AsyncSnapshot<List<Character>> snapshot) {
        if (!snapshot.hasData) return _emptyContainer();
        final characters = snapshot.data!;
        return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: characters.length,
            itemBuilder: (_, int index) =>
                _CharacterItem(characters[index], route));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }

    final appProv = Provider.of<AppProvider>(context, listen: false);
    appProv.getSuggestionsByQuery(query);

    return StreamBuilder(
      stream: appProv.suggestionStream,
      builder: (_, AsyncSnapshot<List<Character>> snapshot) {
        if (!snapshot.hasData) return _emptyContainer();
        final characters = snapshot.data!;
        return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: characters.length,
            itemBuilder: (_, int index) =>
                _CharacterItem(characters[index], route));
      },
    );
  }
}

Widget _emptyContainer() {
  return Container(
    child: Center(
        child: FaIcon(
      FontAwesomeIcons.search,
      color: Colors.grey[300],
      size: 130,
    )),
  );
}

class _CharacterItem extends StatelessWidget {
  final Character character;
  final String route;
  const _CharacterItem(this.character, this.route);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: FadeInImage(
          fadeOutDuration: Duration(milliseconds: 200),
          placeholder: AssetImage('assets/loadingmovie.gif'),
          image: NetworkImage(character.image),
          width: 50,
          fit: BoxFit.cover,
        ),
        title: Text(character.name),
        subtitle: Row(
          children: [
            (character.gender == 'Male')
                ? FaIcon(FontAwesomeIcons.mars, size: 10)
                : FaIcon(FontAwesomeIcons.venus, size: 10),
            SizedBox(width: 2),
            Text(character.status),
          ],
        ),
        onTap: () {
          Navigator.pushReplacementNamed(context, route, arguments: character);
        });
  }
}
