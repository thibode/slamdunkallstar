import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/models/players.dart';
import 'package:slam_dunk_all_star_v2/models/team.dart';
import 'package:slam_dunk_all_star_v2/repository/players_repository.dart';
import 'package:slam_dunk_all_star_v2/repository/team_repository.dart';
import 'package:slam_dunk_all_star_v2/ui/components/cust_bttm_bar.dart';

class Players extends StatefulWidget {
  final String teamId;
  const Players({Key? key, required this.teamId}) : super(key: key);

  @override
  State<Players> createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  late Future<List<Player>> _player;

  @override
  void initState() {
    super.initState();
    _player = PlayerRepository().getPlayersByTeamId(widget.teamId);
  }

  @override
  Widget build(BuildContext context) {
    final teamRepository = TeamRepository();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage('assets/images/720003.jpg'),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.dstATop),
          ),
          color: Colors.white.withOpacity(0.2),
          backgroundBlendMode: BlendMode.dstATop,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
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
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(player.lastname.toString()),
                        radius: 25,
                      ),
                      title: Text(player.firstname.toString() +
                          ' ' +
                          player.lastname.toString()),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Début NBA : ' + player.startNBA.toString()),
                          Text(
                              'Date de naissance : ' + player.birth.toString()),
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
