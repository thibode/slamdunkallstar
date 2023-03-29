import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/authentication/sign_out.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var route = ModalRoute.of(context);

    return BottomAppBar(
      child: (Row(
        children: [
          MaterialButton(
            child: Icon(
              Icons.home,
              color: route?.settings.name == "/" ? Colors.blue : Colors.black,
            ),
            onPressed: () {
              if (route?.settings.name != "/") {
                Navigator.pushNamed(context, "/");
              }
            },
          ),
          Expanded(child: Row()),
          MaterialButton(
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  color: route?.settings.name == "/teams"
                      ? Colors.blue
                      : Colors.black,
                ),
              ],
            ),
            onPressed: () {
              if (route?.settings.name != "/teams") {
                Navigator.pushNamed(context, "/teams");
              }
            },
          ),
          Expanded(child: Row()),
          MaterialButton(
            onPressed: () {
              if (route?.settings.name != "/gameOfTheDay") {
                Navigator.pushNamed(context, "/gameOfTheDay");
              }
            },
            child: Row(
              children: [
                Icon(
                  Icons.games,
                  color: route?.settings.name == "/gameOfTheDay"
                      ? Colors.blue
                      : Colors.black,
                ),
              ],
            ),
          ),
          Expanded(child: Row()),
          MaterialButton(
            onPressed: () {
              if (route?.settings.name != "/signOut") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignOutPage()));
              }
            },
            child: Row(
              children: [
                Icon(
                  Icons.stop,
                  color: route?.settings.name == "/signOut"
                      ? Colors.blue
                      : Colors.black,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
