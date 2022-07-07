import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_app/models/character.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';
import '../../../widgets/circle_avatar.dart';
import '../widgets/info_box.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Character character =
        ModalRoute.of(context)!.settings.arguments as Character;
    final appProv = Provider.of<AppProvider>(context);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:
          (appProv.isSwitched) ? Colors.grey[850] : Colors.purple[100],
      appBar: AppBar(
        backgroundColor:
            (appProv.isSwitched) ? Colors.purple : Colors.purple[100],
        actions: <Widget>[
          Spacer(),
          Container(
            padding: EdgeInsets.only(right: 10, top: 12, bottom: 12),
            child: CircleAvatarWidget(
              radius: 15,
              image: character.image,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
            icon: Icon(Icons.home_filled),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 30),
            ElasticInDown(
              from: 200,
              child: Text(
                character.name,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                maxLines: 2,
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Spacer(),
                InfoBox(Icons.person, 'Status', character.status),
                InfoBox(Icons.perm_contact_cal, 'Species', character.species),
                Spacer(),
              ],
            ),
            Row(
              children: [
                Spacer(),
                InfoBox(FontAwesomeIcons.venusMars, 'Gender', character.gender),
                InfoBox(Icons.location_on_rounded, 'Location',
                    character.location.name),
                Spacer(),
              ],
            ),
            SizedBox(height: 30),
            MaterialButton(
              elevation: 20,
              splashColor: Colors.white,
              onPressed: () {},
              child: Container(
                width: size.width * 0.4,
                height: size.height * 0.06,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: GestureDetector(
                    child: Text(
                      'Get episodes',
                      style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                      ),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text('Episodes'),
                            content: Text('${character.episode}'),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
