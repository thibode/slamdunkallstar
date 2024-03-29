import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:slam_dunk_all_star_v2/providers/team_provider.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/errors/error_404.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/game_of_the_day.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/all_teams.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/authentication/widget_tree.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/authentication/sign_out.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  const bool kReleaseMode = bool.fromEnvironment('dart.vm.product');
  if (kReleaseMode) {
    await dotenv.load(fileName: ".env");
  } else {
    await dotenv.load(fileName: ".env.local");
  }
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TeamProvider()),
      ],
      child: const MainApp(title: "Slam Dunk All Stars"),
    ),
  );
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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: "Slam Dunk All Stars",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const WidgetTree(),
        "/*": (context) => const Error404(),
        "/teams": (context) => const AllTeamScreen(),
        "/gameOfTheDay": (context) => const GameOfTheDay(),
        "/signOut": (context) => SignOutPage(),
      },
    );
  }
}
