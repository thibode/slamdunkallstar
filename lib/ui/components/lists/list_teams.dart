import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slam_dunk_all_star_v2/ui/commons/design.dart' as color;
import 'package:slam_dunk_all_star_v2/providers/team_provider.dart';
import 'package:slam_dunk_all_star_v2/repository/team_repository.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/players.dart';

class TeamListView extends StatelessWidget {
  const TeamListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TeamProvider>(
      builder: (context, teamProvider, _) {
        if (teamProvider.teams.isEmpty) {
          teamProvider.fetchAllTeam();
          return const Center(child: CircularProgressIndicator());
        } else {
          return GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            padding: const EdgeInsets.all(8.0),
            children: List.generate(teamProvider.teams.length, (index) {
              final team = teamProvider.teams[index];
              return Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                color: color.AppColors.lightGrey,
                semanticContainer: true,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () {
                        TeamRepository()
                            .getTeamById(int.parse(team.id.toString()));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlayersView(
                                      teamId: team.id.toString(),
                                    )));
                      },
                      child: Column(
                        children: [
                          if (team.nbaFranchise == true)
                            Image(
                              image: NetworkImage(team.logo.toString()),
                              height: 150,
                              width: 100,
                            ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "[ ${team.city} | ${team.conference} | ${team.division} ]",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      team.name.toString(),
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
              );
            }),
          );
        }
      },
    );
  }
}
