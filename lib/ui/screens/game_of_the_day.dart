import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slam_dunk_all_star_v2/models/game.dart';
import 'package:slam_dunk_all_star_v2/repository/game_repository.dart';

class GameOfTheDay extends StatefulWidget {
  const GameOfTheDay({super.key});

  @override
  State<GameOfTheDay> createState() => _GameOfTheDayState();
}

class _GameOfTheDayState extends State<GameOfTheDay> {
  late Future<List<Game>> _game;

  @override
  void initState() {
    super.initState();
    _game = GameRepository().getDayOfTheDay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Match du Jour \n${DateFormat("dd/MM/yyyy").format(DateTime.now())}",
          textAlign: TextAlign.center,
        )),
      ),
      body: FutureBuilder<List<Game>>(
          future: _game,
          builder: (context, snapshot) {
            List toDaysGame = snapshot.data ?? [];
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: toDaysGame.length,
                  itemBuilder: (context, index) {
                    String visitorPoints =
                        toDaysGame[index].visitorPoints == null
                            ? "0"
                            : toDaysGame[index].visitorPoints.toString();
                    String homePoints = toDaysGame[index].homePoints == null
                        ? "0"
                        : toDaysGame[index].homePoints.toString();
                    int intVisitorPoints = int.parse(visitorPoints);
                    int intHomePoints = int.parse(homePoints);
                    return Container(
                      child: Column(children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              child: Column(
                                children: [
                                  Text(
                                      "${toDaysGame[index].visitorName} - ${toDaysGame[index].homeName}"),
                                  Text(intVisitorPoints > intHomePoints
                                      ? "Vainqueur: ${toDaysGame[index].visitorName} \n ${"$visitorPoints - $homePoints"}"
                                      : (intVisitorPoints == intHomePoints) &&
                                              (intVisitorPoints != 0)
                                          ? "Egalité"
                                          : intVisitorPoints == 0 &&
                                                  intHomePoints == 0
                                              ? "Le match n'a pas encore eu lieu"
                                              : "Vainqueur: ${toDaysGame[index].homeName} \n ${"$visitorPoints - $homePoints"}"),
                                ],
                              ),
                            )
                          ],
                        )
                      ]),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
