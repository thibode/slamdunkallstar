import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/models/team.dart';
import 'package:slam_dunk_all_star_v2/repository/team_repository.dart';
import 'package:slam_dunk_all_star_v2/ui/commons/design.dart' as color;
import 'package:slam_dunk_all_star_v2/ui/components/cust_bttm_bar.dart';
import 'package:slam_dunk_all_star_v2/ui/components/lists/list_todays_game.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/players.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              color.AppColors.black.withOpacity(1),
              color.AppColors.darkGrey.withOpacity(.3)
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Image(
                image: AssetImage("assets/images/logo.png"),
                fit: BoxFit.contain,
                height: 250,
              ),
            ),
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
            Container(
              height: 50,
              decoration: BoxDecoration(color: color.AppColors.blueLogo),
              child: Container(
                margin: const EdgeInsets.only(left: 30),
                child: Center(
                  child: Row(
                    children: const [
                      Icon(Icons.sports_basketball,
                          color: Color.fromARGB(255, 255, 0, 0)),
                      SizedBox(width: 10),
                      Text("Matches du jour",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: SizedBox(
                height: 230,
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
