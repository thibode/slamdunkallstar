import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../models/team.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TeamRepository {
  var headers = {
    'x-apisports-key': dotenv.get("API_KEY"),
  };

  Future<List<Team>> getAllTeams() async {
    final uri = Uri.https(dotenv.get("API_URL"), '/teams');
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      final Map<String, dynamic> result = jsonDecode(response.body);
      final List<dynamic> teamsList = result["response"];
      final List<dynamic> onlyNBA = [];
      for (var team in teamsList) {
        if (team["nbaFranchise"] == true) {
          onlyNBA.add(team);
        }
      }

      onlyNBA.sort((a, b) =>
          (a["name"].toLowerCase().compareTo(b["name"].toLowerCase())));
      return onlyNBA
          .cast<Map<String, dynamic>>()
          .map((e) => Team.fromJson(e))
          .toList();
    } else {
      throw Exception("Requête échoué");
    }
  }

  Future<List<Team>> getTeamById(int? teamId) async {
    var queryParameters = {
      "team": teamId,
    };

    final uri = Uri.https(dotenv.get("API_URL"), 'teams');
    var response = await http.get(uri, headers: headers);

    //charge le json
    final String jsonFileData =
        await rootBundle.loadString('assets/json/team_more_infos.json');
    final Map<String, dynamic> jsonData = jsonDecode(jsonFileData);

    if (response.statusCode == 200) {
      final Map<String, dynamic> result = jsonDecode(response.body);
      final List<dynamic> selectedTeam = result["response"];
      final List team = [];
      for (var teamProps in selectedTeam) {
        for (var data in jsonData.values) {
          if (teamProps["id"] == 1 && data == 1) {
            team.add({data, teamProps});
          }
        }
      }
      return team
          .cast<Map<String, dynamic>>()
          .map((e) => Team.fromJson(e))
          .toList();
    } else {
      throw Exception(Error());
    }
  }
}
