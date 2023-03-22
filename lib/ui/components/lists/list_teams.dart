import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/models/players.dart';
import 'package:slam_dunk_all_star_v2/models/team.dart';
import 'package:slam_dunk_all_star_v2/repository/team_repository.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/players.dart';

class TeamListView extends StatelessWidget {
  const TeamListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Team>>(
      future: TeamRepository().getTeams(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            padding: const EdgeInsets.all(8.0),
            children: List.generate(snapshot.data!.length, (index) {
              return Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                semanticContainer: true,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Players(
                              teamId: snapshot.data![index].id.toString(),
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          if (snapshot.data![index].nbaFranchise == true)
                            Image(
                              image: NetworkImage(
                                  snapshot.data![index].logo.toString()),
                              height: 150,
                              width: 100,
                            ),
                          SizedBox(height: 10),
                          Text(
                            "[ " +
                                snapshot.data![index].city.toString() +
                                " | " +
                                snapshot.data![index].conference.toString() +
                                " | " +
                                snapshot.data![index].division.toString() +
                                " ]",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      snapshot.data![index].name.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              );
            }),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
