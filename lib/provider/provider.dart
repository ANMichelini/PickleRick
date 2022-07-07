import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:new_app/helpers/debouncer.dart';
import 'package:new_app/models/character.dart';
import 'package:new_app/repositories/app_repository.dart';

class AppProvider extends ChangeNotifier {
  final AppRepository appRepository = AppRepository();
  var allCharacters = <Character>[];
  var filteredCharacters = <Character>[];

  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );

  bool _isSwitched = false;
  bool get isSwitched => _isSwitched;
  int _selectedButton = 0;
  int get selectedButton => _selectedButton;

  double _currentPage = 0;
  double get currentPage => _currentPage;

  set currentPage(double page) {
    _currentPage = page;

    notifyListeners();
  }

  set selectedButton(int value) {
    _selectedButton = value;
    notifyListeners();
  }

  set isSwitched(bool value) {
    _isSwitched = value;
    notifyListeners();
  }

  Future<List<Character>> fetchAllCharacters() async {
    final getAllCharacters = await appRepository.getAllCharacters();

    allCharacters = [...allCharacters, ...getAllCharacters];

    notifyListeners();
    return allCharacters;
  }

  final StreamController<List<Character>> _suggestionsStreamController =
      StreamController.broadcast();
  Stream<List<Character>> get suggestionStream =>
      _suggestionsStreamController.stream;

  void getSuggestionsByQuery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await appRepository.filterCharacters(value);
      _suggestionsStreamController.add(results);
    };

    final timer = Timer.periodic(Duration(milliseconds: 50), (_) {
      debouncer.value = searchTerm;
    });

    Future.delayed(Duration(milliseconds: 51)).then((_) => timer.cancel());
  }
}
