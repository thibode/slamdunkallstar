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
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // ignore: prefer_const_constructors
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    // ignore: sort_child_properties_last
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(player.lastname.toString()),
                        radius: 25,
                      ),
                      title: Text('${player.firstname} ${player.lastname}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Début NBA : ${player.startNBA}'),
                          Text('Date de naissance : ${player.birth}'),
                        ],
                      ),
                    ),
                    color: Colors.white,
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
