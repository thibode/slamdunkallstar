import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/models/team.dart';
import 'package:slam_dunk_all_star_v2/repository/team_repository.dart';
import 'package:slam_dunk_all_star_v2/ui/components/cust_bttm_bar.dart';
import 'package:slam_dunk_all_star_v2/ui/components/custom_decoration.dart';
import 'package:slam_dunk_all_star_v2/ui/components/lists/list_todays_game.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/players.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: Row(
          children: const [
            Icon(
              Icons.sports_basketball,
              color: Colors.black,
            ),
            SizedBox(width: 10),
          ],
        ),
        title: const Text("Matchs of the day !"),
      ),
      body: Container(
        decoration: CustomDecoration().customBackground(),
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 70,
              child: FutureBuilder<List<Team>>(
                future: TeamRepository().getAllTeams(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const SizedBox(width: 5),
                          for (Team team in snapshot.data!)
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              child: MaterialButton(
                                onPressed: () {
                                  TeamRepository().getTeamById(
                                      int.parse(team.id.toString()));
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Players(
                                        teamId: team.id.toString(),
                                      ),
                                    ),
                                  );
                                  Image(
                                    image: NetworkImage(team.logo.toString()),
                                    height: 50,
                                    width: 50,
                                  );
                                },
                              ),
                            )
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            const Center(
              child: SizedBox(
                height: 500,
                child: TodaysGameView(),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
