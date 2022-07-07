import 'package:flutter/material.dart';
import 'package:new_app/provider/provider.dart';
import 'package:provider/provider.dart';

import '../../search/searchdelegate.dart';

class DrawerList extends StatefulWidget {
  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  @override
  Widget build(BuildContext context) {
    final appProv = Provider.of<AppProvider>(context);
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 15),
      height: size.height * 0.72,
      child: Column(
        children: [
          menuItem(1, 'Home', Icons.home_filled),
          menuItem(2, 'Gallery', Icons.photo),
          menuItem(3, 'Search', Icons.search),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Row(
              children: [
                Text(
                  (appProv.isSwitched) ? 'Dark mode' : 'Light mode',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                Switch.adaptive(
                    activeColor: Colors.purple,
                    value: appProv.isSwitched,
                    onChanged: (value) {
                      setState(() {
                        appProv.isSwitched = value;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              Navigator.pushReplacementNamed(context, 'home');
            } else if (id == 2) {
              Navigator.pushNamed(context, 'gallery');
            } else if (id == 3) {
              showSearch(
                context: context,
                delegate: CharacterSearchDelegate('character'),
              );
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                icon,
                size: 25,
                color: Colors.grey,
              ),
              SizedBox(width: 15),
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  home,
  gallery,
  search,
}
