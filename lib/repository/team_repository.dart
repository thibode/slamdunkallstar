import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/team.dart';

class TeamRepository {
  var headers = {
    'x-apisports-key': '59e797f543c82c6b08ca0a1631cb3f21',
  };
  Future<List<Team>> fetchTeams() async {
    var url = "https://v2.nba.api-sports.io/teams";
    var response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      // Transformation du JSON (String) en Map<String, dynamic>
      final dynamic json = jsonDecode(response.body);
      var jsonTeams = json['response'];
      final List<Team> teams = []; // Liste que la méthode va renvoyer
      if (json.toString().contains("response")) {
        for (var element in jsonTeams) {
          final Team team = Team.fromJson(element);
          teams.add(team);
        }
      }
      print(teams);
      return teams;
    } else {
      throw Exception('Failed to load teams');
    }
  }
}
