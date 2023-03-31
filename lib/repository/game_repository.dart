import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:slam_dunk_all_star_v2/models/game.dart';
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:http/http.dart" as http;

class GameRepository {
  var headers = {
    "x-rapidapi-key": dotenv.get("API_KEY"),
    "HttpHeaders.contentTypeHeader": 'application/json',
  };

  //Méthode Get of the Day
  Future<List<Game>> getMatchOfTheDay() async {
    DateTime dateNow = DateTime.now();
    String fullYear = DateFormat("yyyy-MM-dd").format(dateNow);

    var queryParameters = {
      "date": fullYear,
    };

    final uri = Uri.https(dotenv.get("API_URL"), "/games", queryParameters);
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      final Map<String, dynamic> result = jsonDecode(response.body);
      final List<dynamic> gameOfTheDay = result["response"];

      return gameOfTheDay
          .cast<Map<String, dynamic>>()
          .map((e) => Game.fromJson(e))
          .toList();
    } else {
      throw Exception("Requête echoué");
    }
  }

  //Méthode Game Statistics
  Future<List<GameStatistic>> getGameStats(String id) async {
    var queryParameters = {"id": id};

    final uri =
        Uri.https(dotenv.get("API_URL"), "games/statistics", queryParameters);
    var response = await http.get(uri, headers: headers);
    final Map<String, dynamic> result = jsonDecode(response.body);
    final List<dynamic> gameStatistcsList = result["response"];
    final List<dynamic> arrayGameStats = [];
    for (var statistics in gameStatistcsList) {
      arrayGameStats.add(statistics);
    }

    return arrayGameStats
        .cast<Map<String, dynamic>>()
        .map((e) => GameStatistic.fromJson(e))
        .toList();
  }
}
