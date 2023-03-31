import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/models/team.dart';
import 'package:slam_dunk_all_star_v2/repository/team_repository.dart';

class TeamProvider extends ChangeNotifier {
  List<Team> _teams = [];
  List<Team> get teams => _teams;

  TeamProvider() {
    fetchAllTeam();
  }

  Future<List<Team>> fetchAllTeam() async {
    final teams = await TeamRepository().getAllTeams();
    _teams = teams;
    notifyListeners();
    return teams;
  }
}
