import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/models/game.dart';
import 'package:slam_dunk_all_star_v2/models/players.dart';
import 'package:slam_dunk_all_star_v2/repository/game_repository.dart';
import 'package:slam_dunk_all_star_v2/repository/players_repository.dart';
import 'package:slam_dunk_all_star_v2/ui/components/custom_decoration.dart';

class PlayerStatsView extends StatefulWidget {
  final String playerId;
  const PlayerStatsView({Key? key, required this.playerId}) : super(key: key);

  @override
  State<PlayerStatsView> createState() => _PlayerStatsViewState();
}

class _PlayerStatsViewState extends State<PlayerStatsView> {
  late Future<List<PlayerStats>> _playerStats;
  late Future<List<Player>> _player;
  late Future<List<Game>> _gameStats;

  @override
  void initState() {
    super.initState();
    _playerStats = PlayerRepository().playerStats(widget.playerId);
    _player = PlayerRepository().getPlayerById(widget.playerId);
    _gameStats = _playerStats.then((playerStats) async {
      final gameIds = playerStats.map((stat) => stat.gameId).toSet();

      final stats = await Future.wait(
          gameIds.map((id) => GameRepository().getGameById(id.toString())));
      return stats.expand((stat) => stat).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Statistiques")),
      body: Container(
        decoration: CustomDecoration().customBackground(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: _player,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  final player = snapshot.data![0];
                  return Text(
                    "${player.firstname} ${player.lastname}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(height: 16),
            FutureBuilder(
              future: Future.wait([_playerStats, _gameStats]),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final playerStat = snapshot.data![0] as List<PlayerStats>;
                  final games = snapshot.data![1] as List<Game>;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: playerStat.length,
                    itemBuilder: (context, index) {
                      final stat = playerStat[index];
                      final game = games.firstWhere(
                          (g) => g.id.toString() == stat.gameId.toString());
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: ListTile(
                          title: Text(
                            "Equipe ${game.homeName} ${game.visitorName}",
                          ),
                          subtitle: Text(
                            "${stat.assists} Assist, ${stat.blocks} blocage, ${stat.offensiveRebond == null ? '0 Rebond Offensif' : '${stat.offensiveRebond} rebond Offensif'}",
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
          ],
        ),
      ),
    );
  }
}
