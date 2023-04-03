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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.sports_basketball,
              color: Colors.black,
            ),
            SizedBox(width: 10),
            Text(
              "Les matchs du jour :",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: Container(
        decoration: CustomDecoration().customBackground(),
        child: const TodaysGameView(),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
