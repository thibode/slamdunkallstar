import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/models/players.dart';
import 'package:slam_dunk_all_star_v2/repository/players_repository.dart';
import 'package:slam_dunk_all_star_v2/ui/components/custom_decoration.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/player_stat.dart';

class SearchPlayerView extends StatefulWidget {
  const SearchPlayerView({super.key});

  @override
  State<SearchPlayerView> createState() => _SearchPlayerViewState();
}

class _SearchPlayerViewState extends State<SearchPlayerView> {
  List<Player>? _searchResults;
  Future<List<Player>> _searchPlayer(String playerName) async {
    try {
      return await PlayerRepository().searchPlayer(playerName);
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    _searchResults = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slam Dunk All Stars"),
      ),
      body: Container(
        decoration: CustomDecoration().customBackground(),
        child: Column(children: [
          TextField(
            onChanged: (value) async {
              if (value.length >= 3) {
                final PlayerRepository playerRepository = PlayerRepository();
                List<Player> players =
                    await playerRepository.searchPlayer(value);
                setState(() {
                  _searchResults = players;
                });
              } else {
                setState(() {
                  _searchResults = [];
                });
              }
            },
            decoration: InputDecoration(
                labelStyle: const TextStyle(color: Colors.white),
                hintStyle: const TextStyle(color: Colors.white),
                hintText: "Rechercher le nom d'un joueur",
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  color: Colors.white,
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0))),
          ),
          if (_searchResults!.isNotEmpty)
            Expanded(
              child: ListView.separated(
                itemCount: _searchResults!.length,
                itemBuilder: (context, index) {
                  final Player player = _searchResults![index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlayerStatsView(
                              playerId: player.playerId.toString()),
                        ),
                      );
                    },
                    title: Text(
                      "${player.firstname.toString()} ${player.lastname.toString()}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 0,
                  );
                },
              ),
            )
        ]),
      ),
    );
  }
}
