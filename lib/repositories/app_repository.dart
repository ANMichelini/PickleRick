import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/allcharacters.dart';
import '../models/character.dart';

class AppRepository {
  AppRepository();

  String _baseUrl = 'rickandmortyapi.com';
  int _page = 0;

  Future _getJsonData({required String endpoint, int page = 1}) async {
    final url = Uri.https(
      _baseUrl,
      endpoint,
      {"page": page.toString()},
    );

    final response = await http.get(url);
    final Map<String, dynamic> responseMap = json.decode(response.body);
    return responseMap;
  }

  Future _getJsonDataByName({required String endpoint, String? name}) async {
    final url = Uri.https(
      _baseUrl,
      endpoint,
      {"name": name},
    );

    final response = await http.get(url);
    final Map<String, dynamic> responseMap = json.decode(response.body);
    return responseMap;
  }

  Future<List<Character>> getAllCharacters() async {
    _page++;
    final jsonData =
        await _getJsonData(endpoint: '/api/character', page: _page);
    final charactersResponse = AllCharacters.fromJson(jsonData);
    return charactersResponse.results;
  }

  Future<List<Character>> filterCharacters(String name) async {
    final jsonData =
        await _getJsonDataByName(endpoint: '/api/character', name: name);
    final filterResponse = AllCharacters.fromJson(jsonData);
    return filterResponse.results;
  }
}
