import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/errors/error_404.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/game_of_the_day.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/home.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/all_teams.dart';

Future main() async {
  const bool kReleaseMode = bool.fromEnvironment('dart.vm.product');
  if (kReleaseMode) {
    await dotenv.load(fileName: ".env");
  } else {
    await dotenv.load(fileName: ".env.local");
  }
  runApp(const MainApp(title: "Slam Dunk All Stars"));
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
        "/": (context) => const Home(),
        "/*": (context) => const Error404(),
        "/teams": (context) => const AllTeamScreen(),
        "/gameOfTheDay": (context) => const GameOfTheDay(),
        // "/listMatch": (context) => ListMatch(),
      },
    );
  }
}
