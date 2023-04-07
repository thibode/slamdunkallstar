import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slam_dunk_all_star_v2/models/game.dart';
import 'package:slam_dunk_all_star_v2/models/game_players_stat.dart';
import 'package:slam_dunk_all_star_v2/models/players.dart';
import 'package:slam_dunk_all_star_v2/repository/game_repository.dart';
import 'package:slam_dunk_all_star_v2/repository/players_repository.dart';
import 'package:slam_dunk_all_star_v2/ui/components/custom_decoration.dart';

import 'game_statistics.dart';

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
      appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text("Statistiques du joueur :")),
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
                  return Container(
                    margin: const EdgeInsets.all(20),
                    child: Text(
                      "${player.firstname} ${player.lastname} :",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
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
                // Accédez aux données des deux futures à l'intérieur de `snapshot.data`
                // en utilisant leur index respectif [0] et [1]
                if (snapshot.hasData) {
                  List<PlayerStats> playerStats =
                      snapshot.data![0] as List<PlayerStats>;
                  List<Game> games = snapshot.data![1] as List<Game>;

                  List<GamePlayerStat> teamNames = playerStats
                      .where((playerStat) =>
                          games.any((game) => game.id == playerStat.gameId))
                      .map((playerStat) {
                    // Obtenir le jeu correspondant
                    Game? game = games.firstWhere(
                        (game) => game.id == playerStat.gameId,
                        orElse: () =>
                            Game()); // Remplacer les valeurs par défaut appropriées

                    // Créer un objet TeamNames avec les propriétés souhaitées
                    String? homeName = game.homeName;
                    String? visitorName = game.visitorName;
                    String? position = playerStat.position;
                    int? threePointerMade = playerStat.threePointersMade;
                    int? assists = playerStat.assists;
                    int? points = playerStat.points;
                    int? steals = playerStat.steals;
                    int? blocks = playerStat.blocks;
                    int? turnovers = playerStat.turnovers;
                    String? playingTime = playerStat.playingTime;
                    int? offensiveRebond = playerStat.offensiveRebond;
                    int? fouls = playerStat.fouls;
                    int? defensiveRebond = playerStat.defensiveRebond;
                    // Remplacer par la propriété réelle
                    return GamePlayerStat(
                      homeName: homeName,
                      visitorName: visitorName,
                      threePointersMade: threePointerMade,
                      fouls: fouls,
                      position: position,
                      assists: assists,
                      points: points,
                      steals: steals,
                      blocks: blocks,
                      turnovers: turnovers,
                      playingTime: playingTime,
                      offensiveRebond: offensiveRebond,
                      defensiveRebond: defensiveRebond,
                    );
                  }).toList();

                  return Expanded(
                    child: ListView.builder(
                      itemCount: teamNames.length,
                      itemBuilder: (context, index) {
                        // Utiliser les propriétés de TeamNames dans l'affichage
                        return ListTile(
                          title: MaterialButton(
                            onPressed: () {
                              GameRepository().getGameStats(
                                playerStats[index].gameId.toString(),
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GameStatisticsView(
                                            id: playerStats[index]
                                                .gameId
                                                .toString(),
                                          )));
                            },
                            child: Text(
                                "${teamNames[index].homeName} VS ${teamNames[index].visitorName}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center),
                          ),
                          subtitle: Container(
                            margin: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Position: ${teamNames[index].position}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Points: ${teamNames[index].points}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Trois points: ${teamNames[index].threePointersMade}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Assists: ${teamNames[index].assists}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Vol du ballon: ${teamNames[index].steals}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Contre: ${teamNames[index].turnovers}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Fautes: ${teamNames[index].fouls}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  // Gérez les erreurs si nécessaire
                  return Text("${snapshot.error}");
                } else {
                  // Affichez un indicateur de chargement en attendant que les futures soient complets
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
