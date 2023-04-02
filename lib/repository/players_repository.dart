import "dart:convert";

import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:slam_dunk_all_star_v2/models/players.dart";
import "package:http/http.dart" as http;

class PlayerRepository {
  Map<String, String> headers = {
    "x-rapidapi-key": dotenv.get("API_KEY"),
    "HttpHeaders.contentTypeHeader": 'application/json',
  };
  var dateNow = DateTime.now();

  Future<List<Player>> getPlayerById(String playerId) async {
    Map<String, dynamic> queryParameters = {
      "id": playerId,
    };

    final uri = Uri.https(dotenv.get("API_URL"), '/players', queryParameters);
    var response = await http.get(uri, headers: headers);

    final Map<String, dynamic> result = jsonDecode(response.body);
    final List<dynamic> features = result["response"];

    return features
        .cast<Map<String, dynamic>>()
        .map((e) => Player.fromJson(e))
        .toList();
  }

  Future<List<Player>> getPlayersByTeamId(String teamId) async {
    int month = dateNow.month;
    var seasonYear = dateNow.year;
    //Condition pour les saisons de la NBA,
    //Les nouvelles saison de la NBA commencent généralement entre le 18 et 31 octobre

    if (month >= 10 && month <= 12) {
      var queryParameters = {
        "season": seasonYear.toString(),
        "team": teamId,
      };

      final uri = Uri.https(dotenv.get("API_URL"), '/players', queryParameters);
      var response = await http.get(uri, headers: headers);
      final Map<String, dynamic> result = jsonDecode(response.body);
      final List<dynamic> features = result["response"];

      return features
          .cast<Map<String, dynamic>>()
          .map((e) => Player.fromJson(e))
          .toList();
    }

    //Si inférieur à 10, la saison doit être celle de l'année dernière
    //donc on est en 1990, la saison en cours et celle de 1989

    if (month < 10) {
      seasonYear = seasonYear - 1;
      var queryParameters = {"season": seasonYear.toString(), "team": teamId};
      final uri = Uri.https(dotenv.get("API_URL"), '/players', queryParameters);
      var response = await http.get(uri, headers: headers);
      final Map<String, dynamic> result = jsonDecode(response.body);
      final List<dynamic> features = result["response"];

      return features
          .cast<Map<String, dynamic>>()
          .map((e) => Player.fromJson(e))
          .toList();
    } else {
      throw Exception("Requête échoué");
    }
  }

  Future<List<Player>> searchPlayer(String playerName) async {
    //Condition pour les saisons de la NBA,
    //Les nouvelles saison de la NBA commencent généralement entre le 18 et 31 octobre

    Map<String, dynamic> queryParameters = {
      "search": playerName,
    };

    final uri = Uri.https(dotenv.get("API_URL"), '/players', queryParameters);
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      final List<Player> players = [];
      final Map<String, dynamic> result = jsonDecode(response.body);
      if (result.containsKey("response")) {
        final List<dynamic> features = result["response"];

        for (Map<String, dynamic> feature in features) {
          players.add(Player.fromJson(feature));
        }
      }
      return players;
    } else {
      throw Exception("Une erreur est survenue");
    }
  }

  Future<List<PlayerStats>> playerStats(String playerId) async {
    int month = dateNow.month;
    var seasonYear = dateNow.year;

    if (month >= 10 && month <= 12) {
      var queryParameters = {"id": playerId, "season": seasonYear.toString()};
      final uri = Uri.https(
          dotenv.get("API_URL"), "/players/statistics", queryParameters);
      final response = await http.get(uri, headers: headers);
      final Map<String, dynamic> result = jsonDecode(response.body);
      final List<dynamic> features = result["response"];
      return features
          .cast<Map<String, dynamic>>()
          .map((e) => PlayerStats.fromJson(e))
          .toList();
    }
    if (month < 10) {
      seasonYear = seasonYear - 1;
      var queryParameters = {"id": playerId, "season": seasonYear.toString()};
      final uri = Uri.https(
          dotenv.get("API_URL"), "/players/statistics", queryParameters);
      final response = await http.get(uri, headers: headers);
      final Map<String, dynamic> result = jsonDecode(response.body);
      final List<dynamic> features = result["response"];
      return features
          .cast<Map<String, dynamic>>()
          .map((e) => PlayerStats.fromJson(e))
          .toList();
    } else {
      throw Exception("Une erreur est survenue");
    }
  }
}
