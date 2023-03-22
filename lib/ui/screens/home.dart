import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:slam_dunk_all_star_v2/models/team.dart';
import 'package:slam_dunk_all_star_v2/repository/team_repository.dart';
import 'package:slam_dunk_all_star_v2/ui/components/cust_bttm_bar.dart';
import '../commons/design.dart' as color;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.9)),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Slam Dunk All Stars",
                  style: TextStyle(fontSize: 36, color: color.AppColors.red),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(color: color.AppColors.blue),
            child: Container(
              margin: EdgeInsets.only(left: 30),
              child: Row(
                children: [Text("Matches du jour")],
              ),
            ),
          ),
          Container(
            child: FutureBuilder<List<Team>>(
              future: TeamRepository().getTeams(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (Team team in snapshot.data!)
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Image(
                              image: NetworkImage(team.logo.toString()),
                              height: 50,
                              width: 50,
                            ),
                          ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const CircularProgressIndicator();
              },
            ),
          )
        ]),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }


}
