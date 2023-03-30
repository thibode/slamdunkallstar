import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/models/game.dart';
import 'package:slam_dunk_all_star_v2/repository/game_repository.dart';
import 'package:slam_dunk_all_star_v2/ui/components/custom_decoration.dart';

class GameStatisticsView extends StatefulWidget {
  final String id;
  const GameStatisticsView({Key? key, required this.id}) : super(key: key);

  @override
  State<GameStatisticsView> createState() => _GameStatisticsViewState();
}

class _GameStatisticsViewState extends State<GameStatisticsView> {
  late Future<List<GameStatistic>> _gameStats;
  int _selectedTeamIndex = 0;

  @override
  void initState() {
    super.initState();
    _gameStats = GameRepository().getGameStats(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game Statistics"),
      ),
      body: Container(
        decoration: CustomDecoration().customBackground(),
        child: FutureBuilder(
          future: _gameStats,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final firstTeamStats = <GameStatistic>[];
              final secondTeamStats = <GameStatistic>[];
              final selectedTeamStats =
                  _selectedTeamIndex == 0 ? firstTeamStats : secondTeamStats;
              firstTeamStats.add(snapshot.data![0]);
              secondTeamStats.add(snapshot.data![1]);
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Wrap(
                        children: [
                          ...firstTeamStats.asMap().entries.map((entry) {
                            final index = entry.key;
                            final stat = entry.value;
                            return ChoiceChip(
                              label: Text(stat.name.toString()),
                              selected: _selectedTeamIndex == index,
                              onSelected: (isSelected) {
                                if (isSelected) {
                                  setState(() {
                                    _selectedTeamIndex = index;
                                  });
                                }
                              },
                            );
                          }).toList()
                        ],
                      ),
                      Wrap(
                        children: [
                          ...secondTeamStats.asMap().entries.map((entry) {
                            final index = entry.key;
                            final stat = entry.value;
                            return ChoiceChip(
                              label: Text(stat.name.toString()),
                              selected: _selectedTeamIndex ==
                                  firstTeamStats.length + index,
                              onSelected: (isSelected) {
                                if (isSelected) {
                                  setState(() {
                                    _selectedTeamIndex =
                                        firstTeamStats.length + index;
                                  });
                                }
                              },
                            );
                          }).toList()
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      children: selectedTeamStats.map((stat) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Image(
                              image: NetworkImage(stat.logo.toString()),
                              height: 70,
                            ),
                            Text(stat.name.toString(),
                                style: const TextStyle(fontSize: 40)),
                            Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Nombre tir réussi:"),
                                    Text(stat.fieldGoalsMade.toString()),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Nombre de tir tenté:"),
                                    Text(stat.fieldGoalsAttempt.toString()),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Pourcentage de tir réussi"),
                                    Text(stat.fieldGoalsPercentage.toString()),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                        "Nombre de lancer franc réussi:"),
                                    Text(stat.freeThrowsMade.toString()),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Nombre de lancé franc tenté:"),
                                    Text(stat.freeThrowsAttempt.toString()),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Pourcentage de lancé franc:"),
                                    Text(stat.freeThrowsPercentage.toString()),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Nombre de 3 points réussi"),
                                    Text(stat.threePointersAttempt.toString()),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Nombre de 3 points tenté"),
                                    Text(stat.threePointersAttempt.toString()),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                        "Pourcentage de 3 points réussi"),
                                    Text(stat.threePointersPercentage
                                        .toString()),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("nombre d'assists"),
                                    Text(stat.assists.toString()),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Points total: "),
                                    Text(stat.points.toString()),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Nombre de vole: "),
                                    Text(stat.steals.toString()),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Nombre de faute: "),
                                    Text(stat.fouls.toString()),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Nombre de turnover: "),
                                    Text(stat.turnovers.toString()),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Nombre de rebond offensif: "),
                                    Text(stat.offensiveRebond.toString()),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Nombre de rebond defensif: "),
                                    Text(stat.defensiveRebond.toString()),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Nombre de total de rebond: "),
                                    Text(stat.totalRebond.toString()),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Nombre de tir bloqué: "),
                                    Text(stat.blocks.toString()),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                        // return ListTile(
                        //   title: Text(stat.name.toString()),
                        // );
                      }).toList(),
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
