import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var route = ModalRoute.of(context);

    return BottomAppBar(
      child: (Row(
        children: [
          const Padding(padding: EdgeInsets.all(30)),
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
          // Expanded(child: Row()),
          // MaterialButton(
          //   child: Icon(
          //     Icons.man,
          //     color: route?.settings.name == "/players"
          //         ? Colors.blue
          //         : Colors.black,
          //   ),
          //   onPressed: () {
          //     if (route?.settings.name != "/players") {
          //       Navigator.pushNamed(context, "/players");
          //     }
          //   },
          // ),
          Expanded(child: Row()),
          MaterialButton(
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  color:
                      route?.settings.name == "/" ? Colors.blue : Colors.black,
                ),
                const Text("Liste des équipes"),
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
              children: const [
                Icon(
                  Icons.games,
                ),
                Text("Match du jour")
              ],
            ),
          )
        ],
      )),
    );
  }
}
