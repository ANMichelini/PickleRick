import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';
import '../../search/searchdelegate.dart';
import '../widgets/card.dart';
import '../widgets/drawer_list.dart';
import '../widgets/header_drawer.dart';
import '../widgets/info_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appProv = Provider.of<AppProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: (appProv.isSwitched) ? Colors.grey[850] : Colors.white,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          );
        }),
      ),
      drawer: Container(
        width: size.width * 0.6,
        child: Drawer(
          child: Column(
            children: [
              HeaderDrawer(),
              DrawerList(),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 20),
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/rickandmorty.jpg'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    GestureDetector(
                        child: BounceInLeft(
                          child: CardWidget('Search'),
                          from: 50,
                        ),
                        onTap: () {
                          showSearch(
                            context: context,
                            delegate: CharacterSearchDelegate('character'),
                          );
                        }),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'gallery');
                      },
                      child: BounceInLeft(
                        child: CardWidget('Gallery'),
                        from: 50,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: InfoWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
