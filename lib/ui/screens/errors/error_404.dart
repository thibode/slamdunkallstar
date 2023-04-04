import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/ui/components/custom_decoration.dart';

class Error404 extends StatelessWidget {
  const Error404({super.key});

  Widget _backButton(context) {
    var route = ModalRoute.of(context);
    return MaterialButton(
      child: const Icon(
        Icons.cancel_sharp,
        color: Colors.white,
      ),
      onPressed: () {
        if (route?.settings.name != "/") {
          Navigator.pop(context, "/gameOfTheDay");
        }
      },
    );
  }

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
              "Erreur d'affichage :",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: Container(
          decoration: CustomDecoration().customBackground(),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: const Text(
                  "Le match que vous souhaitez consulter n'a pas été trouvé, car il n'a pas été joué ou alors nous n'avons pas encore récupérer de données sur ce match.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _backButton(context),
            ],
          )),
    );
  }
}
