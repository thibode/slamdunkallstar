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
              color: route?.settings.name == "/"
                  ? const Color.fromARGB(255, 239, 115, 106)
                  : Colors.black,
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
                      ? const Color.fromARGB(255, 239, 115, 106)
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
                  Icons.sports_basketball_rounded,
                  color: route?.settings.name == "/gameOfTheDay"
                      ? const Color.fromARGB(255, 239, 115, 106)
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
                  Icons.exit_to_app,
                  color: route?.settings.name == "/signOut"
                      ? const Color.fromARGB(255, 239, 115, 106)
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
