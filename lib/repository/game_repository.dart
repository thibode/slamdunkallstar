import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:slam_dunk_all_star_v2/models/game.dart';
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:http/http.dart" as http;

class GameRepository {
  Future<List<Game>> getDayOfTheDay() async {
    var headers = {
      "x-rapidapi-key": dotenv.get("API_KEY"),
      "HttpHeaders.contentTypeHeader": 'application/json',
    };

    DateTime dateNow = DateTime.now();
    String fullYear = DateFormat("yyyy-MM-dd").format(dateNow);
    int year = int.parse(DateFormat("yyyy").format(dateNow));
    int month = int.parse(DateFormat("MM").format(dateNow));

    if (month >= 10 && month <= 12) {
      var queryParameters = {
        "season": year.toString(),
        "date": fullYear,
      };
      final uri = Uri.https(dotenv.get("API_URL"), "/games", queryParameters);
      var response = await http.get(uri, headers: headers);
      final Map<String, dynamic> result = jsonDecode(response.body);
      final List<dynamic> gameOfTheDay = result["response"];

      return gameOfTheDay
          .cast<Map<String, dynamic>>()
          .map((e) => Game.fromJson(e))
          .toList();
    }

    if (month < 10) {
      var queryParameters = {
        "season": (year - 1).toString(),
        "date": fullYear,
      };
      final uri = Uri.https(dotenv.get("API_URL"), "/games", queryParameters);
      var response = await http.get(uri, headers: headers);
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
}
