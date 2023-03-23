import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/models/team.dart';
import 'package:slam_dunk_all_star_v2/repository/team_repository.dart';
import 'package:slam_dunk_all_star_v2/ui/components/cust_bttm_bar.dart';

const kPrimaryColor = Color(0xFF1D428A);
const kSecondaryColor = Color(0xFFE23E3E);

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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromARGB(255, 60, 83, 131), Color.fromARGB(255, 197, 115, 115)],
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
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              decoration: const BoxDecoration(color: kPrimaryColor),
              child: Container(
                margin: const EdgeInsets.only(left: 30),
                child: Row(
                  children: const [
                    Icon(Icons.sports_basketball, color: Color.fromARGB(255, 255, 0, 0)),
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
            const SizedBox(height: 5),
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
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
