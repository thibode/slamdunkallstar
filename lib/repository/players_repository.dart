import "dart:convert";

import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:slam_dunk_all_star_v2/models/players.dart";
import "package:http/http.dart" as http;

class PlayerRepository {
  var headers = {
    "x-rapidapi-key": dotenv.get("API_KEY"),
    "HttpHeaders.contentTypeHeader": 'application/json',
  };

  Future<List<Player>> getPlayersByTeamId(String teamId) async {
    var dateNow = new DateTime.now();
    var seasonYear = dateNow.year;

    //Condition pour les saisons de la NBA,
    //Les nouvelles saison de la NBA commencent généralement entre le 18 et 31 octobre

    if (dateNow.month >= 10 && dateNow.month <= 12) {
      var queryParameters = {
        "season": seasonYear.toString(),
        "team": teamId,
      };
      final uri = Uri.https(dotenv.get("API_URL"), '/players', queryParameters);
      var response = await http.get(uri, headers: headers);
      final Map<String, dynamic> result = jsonDecode(response.body);
      final List<dynamic> playersList = result["response"];

      return playersList
          .cast<Map<String, dynamic>>()
          .map((e) => Player.fromJson(e))
          .toList();
    }

    //Si inférieur à 10, la saison doit être celle de l'année dernière
    //donc on est en 1990, la saison en cours et celle de 1989

    if (dateNow.month < 10) {
      seasonYear = seasonYear - 1;
      var queryParameters = {"season": seasonYear.toString(), "team": teamId};
      final uri = Uri.https(dotenv.get("API_URL"), '/players', queryParameters);
      var response = await http.get(uri, headers: headers);
      final Map<String, dynamic> result = jsonDecode(response.body);
      final List<dynamic> playersList = result["response"];
      
      return playersList
          .cast<Map<String, dynamic>>()
          .map((e) => Player.fromJson(e))
          .toList();
    } else {
      throw Exception("Requête échoué");
    }
  }
}
