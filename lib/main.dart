import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/repository/team_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/errors/error_404.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/game_of_the_day.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/home.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/players.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/teams.dart';
import 'models/team.dart';
import '../models/environment.dart';

Future main() async {
  const bool kReleaseMode = bool.fromEnvironment('dart.vm.product');
  if (kReleaseMode) {
    await dotenv.load(fileName: ".env");
  } else {
    await dotenv.load(fileName: ".env.local");
  }
  runApp(MainApp(title: "Slam Dunk All Stars"));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key, required this.title});

  final String title;

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(fontFamily: "PermanentMarker"),
      title: "Slam Dunk All Stars",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Home(),
        "/*": (context) => Error404(),
        "/teams": (context) => TeamScreen(),
        "/gameOfTheDay": (context) => GameOfTheDay(),
        // "/listMatch": (context) => ListMatch(),
      },
    );
  }
}
