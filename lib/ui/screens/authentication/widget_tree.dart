import 'package:slam_dunk_all_star_v2/models/auth.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/authentication/login_register_page.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/authentication/sign_out.dart';
import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/home.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Home();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
