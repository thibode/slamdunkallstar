import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/models/game.dart';
import 'package:slam_dunk_all_star_v2/repository/game_repository.dart';
import 'package:slam_dunk_all_star_v2/ui/components/cust_bttm_bar.dart';
import 'package:slam_dunk_all_star_v2/ui/components/custom_decoration.dart';
import 'package:slam_dunk_all_star_v2/ui/components/lists/list_todays_game.dart';

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
    _game = GameRepository().getMatchOfTheDay();
    _game = GameRepository().getMatchOfTheDay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: Row(
          children: [
            const Icon(
              Icons.sports_basketball,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
            const SizedBox(width: 10),
          ],
        ),
        title: const Text("Matchs of the day !"),
      ),
      body: Container(
          decoration: customDecoration().customBackground(),
          child: const TodaysGameView()),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
