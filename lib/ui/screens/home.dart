import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/ui/components/cust_bttm_bar.dart';
import 'package:slam_dunk_all_star_v2/ui/components/custom_decoration.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Icon(
              Icons.sports_basketball,
              color: Colors.black,
            ),
            const SizedBox(width: 10),
            const Text(
              "Accueil",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: Container(
        decoration: CustomDecoration().customBackground(),
        child: Column(
          children: const [
            Text(
              "Add Text right here for home don't forget thibode",
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
