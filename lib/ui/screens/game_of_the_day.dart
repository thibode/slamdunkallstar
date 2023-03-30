import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/ui/components/cust_bttm_bar.dart';
import 'package:slam_dunk_all_star_v2/ui/components/custom_decoration.dart';
import 'package:slam_dunk_all_star_v2/ui/components/lists/list_todays_game.dart';

class GameOfTheDay extends StatefulWidget {
  const GameOfTheDay({super.key});

  @override
  State<GameOfTheDay> createState() => _GameOfTheDayState();
}

class _GameOfTheDayState extends State<GameOfTheDay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Icon(
              Icons.sports_basketball,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            const SizedBox(width: 10),
          ],
        ),
        title: const Text("Matchs of the day !"),
      ),
      body: Container(
          decoration: CustomDecoration().customBackground(),
          child: const TodaysGameView()),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
