import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/models/players.dart';
import 'package:slam_dunk_all_star_v2/repository/players_repository.dart';
import 'package:slam_dunk_all_star_v2/repository/team_repository.dart';
import 'package:slam_dunk_all_star_v2/ui/components/cust_bttm_bar.dart';
import 'package:slam_dunk_all_star_v2/ui/components/custom_decoration.dart';

class PlayersView extends StatefulWidget {
  final String teamId;
  const PlayersView({Key? key, required this.teamId}) : super(key: key);

  @override
  State<PlayersView> createState() => _PlayersViewState();
}

class _PlayersViewState extends State<PlayersView> {
  late Future<List<Player>> _player;

  @override
  void initState() {
    super.initState();
    _player = PlayerRepository().getPlayersByTeamId(widget.teamId);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final teamRepository = TeamRepository();

    return Scaffold(
      body: Container(
        decoration: CustomDecoration().customBackground(),
        child: FutureBuilder(
          future: _player,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final player = snapshot.data![index];
                  return Card(
                    color: Color.fromARGB(186, 255, 253, 253),
                    elevation: 4.0,
                    semanticContainer: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // ignore: prefer_const_constructors
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    // ignore: sort_child_properties_last
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          "./assets/images/basketteur.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      title: Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text(
                          '${player.firstname} ${player.lastname}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      subtitle: Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Début NBA : ${player.startNBA}',
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Date de naissance : ${player.birth}',
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Ville de naissance : ${player.birthCountry}',
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Ecole : ${player.college}',
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Taille : ${player.meters}',
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Poids: ${player.weight}',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
