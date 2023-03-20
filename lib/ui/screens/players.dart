import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:slam_dunk_all_star_v2/models/players.dart';
import 'package:slam_dunk_all_star_v2/repository/players_repository.dart';
import 'package:slam_dunk_all_star_v2/repository/team_repository.dart';
import 'package:slam_dunk_all_star_v2/ui/components/cust_bttm_bar.dart';
import '../commons/design.dart' as color;

class Players extends StatefulWidget {
  // const Players({super.key});
  final String teamId;
  Players({required this.teamId});
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
        body: FutureBuilder(
            future: _player,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              MaterialButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => Players(
                                    //             teamId: snapshot.data![index].id
                                    //                 .toString())));
                                  },
                                  child: Text(snapshot.data![index].firstname
                                      .toString())),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else {
                return const CircularProgressIndicator();
              }
            }),
        bottomNavigationBar: CustomBottomAppBar());
  }
}
