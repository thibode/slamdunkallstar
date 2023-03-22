import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:slam_dunk_all_star_v2/models/team.dart';
import 'package:slam_dunk_all_star_v2/repository/team_repository.dart';
import 'package:slam_dunk_all_star_v2/ui/components/lists/list_teams.dart';

class AllTeamScreen extends StatefulWidget {
  const AllTeamScreen({super.key});

  @override
  State<AllTeamScreen> createState() => _AllTeamScreenState();
}

class _AllTeamScreenState extends State<AllTeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teams screen"),
      ),
      body: const TeamListView(),
    );
  }
}
