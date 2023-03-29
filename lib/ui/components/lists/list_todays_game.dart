import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:slam_dunk_all_star_v2/models/game.dart';
import 'package:slam_dunk_all_star_v2/repository/game_repository.dart';

class TodaysGameView extends StatefulWidget {
  const TodaysGameView({super.key});

  @override
  State<TodaysGameView> createState() => _TodaysGameViewState();
}

class _TodaysGameViewState extends State<TodaysGameView> {
  late Future<List<Game>> _game;

  @override
  void initState() {
    super.initState();
    _game = GameRepository().getDayOfTheDay();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Game>>(
        future: _game,
        builder: (context, snapshot) {
          List toDaysGame = snapshot.data ?? [];
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: toDaysGame.length,
                itemBuilder: (context, index) {
                  String visitorPoints = toDaysGame[index].visitorPoints == null
                      ? "0"
                      : toDaysGame[index].visitorPoints.toString();
                  String homePoints = toDaysGame[index].homePoints == null
                      ? "0"
                      : toDaysGame[index].homePoints.toString();
                  int intVisitorPoints = int.parse(visitorPoints);
                  int intHomePoints = int.parse(homePoints);
                  return Container(
                    margin: EdgeInsets.only(left: 50, right: 50),
                    child: Center(
                      child: Column(children: [
                        Row(
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              child: Column(
                                children: [
                                  Text(
                                    "${toDaysGame[index].visitorName} - ${toDaysGame[index].homeName}",
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    intVisitorPoints > intHomePoints
                                        ? "Vainqueur: ${toDaysGame[index].visitorName} \n ${"$visitorPoints - $homePoints"}"
                                        : (intVisitorPoints == intHomePoints) &&
                                                (intVisitorPoints != 0)
                                            ? "Egalité"
                                            : intVisitorPoints == 0 &&
                                                    intHomePoints == 0
                                                ? "Le match n'a pas encore eu lieu"
                                                : "Vainqueur: ${toDaysGame[index].homeName} \n ${"$visitorPoints - $homePoints"}",
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ]),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
