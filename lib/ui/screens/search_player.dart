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
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Rechercher un joueur :"),
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
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
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelStyle: const TextStyle(color: Colors.white),
              hintStyle: const TextStyle(color: Colors.white),
              hintText: "Rechercher le nom d'un joueur",
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                color: Colors.white,
                onPressed: () {},
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            ),
            cursorColor: Colors.white,
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
