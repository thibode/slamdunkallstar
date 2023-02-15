import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/team.dart';

class TeamRepository {
  var headers = {
    'x-apisports-key': '59e797f543c82c6b08ca0a1631cb3f21',
  };
  Future<List<Team>> fetchTeams() async {
    print("Je suis dans la fonction");
    var url = "https://v2.nba.api-sports.io/teams";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print("Je suis dans la reponse");
      final List<Team> teams = []; // Liste que la méthode va renvoyer

      // Transformation du JSON (String) en Map<String, dynamic>
      final Map<String, dynamic> json = jsonDecode(response.body);
      print(response.body);
      print(jsonDecode(response.body));
      if (json.containsKey("features")) {
        // Récupération des "features"
        final List<dynamic> features = json['features'];

        // Transformation de chaque "feature" en objet de type "Team"
        for (Map<String, dynamic> feature in features) {
          final Team team = Team.fromJson(feature);
          teams.add(team);
        }
      }
      print(teams);
      return teams;
    } else {
      print("Je n'y suis pas");
      throw Exception('Failed to load teams');
    }
  }
}
