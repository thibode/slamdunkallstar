import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/team.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TeamRepository {
  var headers = {
    'x-apisports-key': dotenv.get("API_KEY"),
  };

  Future<List<Team>> getTeams() async {
    var response = await http
        .get(Uri.parse("https://v2.nba.api-sports.io/teams"), headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> result = jsonDecode(response.body);
      final List<dynamic> teamsList = result["response"];
      return teamsList
          .cast<Map<String, dynamic>>()
          .map((e) => Team.fromJson(e))
          .toList();
    } else {
      throw Exception("Requête échoué");
    }
  }
}
