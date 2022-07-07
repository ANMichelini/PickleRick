import 'package:flutter/material.dart';
import 'package:new_app/provider/provider.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider(), lazy: false),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appProv = Provider.of<AppProvider>(context);
    return MaterialApp(
      theme: ThemeData(
        brightness: (appProv.isSwitched) ? Brightness.dark : Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty App',
      home: HomeScreen(),
      routes: {
        'gallery': (context) => GalleryScreen(),
        'home': (context) => HomeScreen(),
        'character': (context) => CharacterScreen(),
      },
    );
  }
}
