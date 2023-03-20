import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:slam_dunk_all_star_v2/ui/components/cust_bttm_bar.dart';
import '../commons/design.dart' as color;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.9)),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Slam Dunk All Stars",
                  style: TextStyle(fontSize: 36, color: color.AppColors.red),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(color: color.AppColors.blue),
            child: Container(
              margin: EdgeInsets.only(left: 30),
              child: Row(
                children: [Text("Matches du jour")],
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  //afficher les matches
                  children: [Column(), Column()],
                )
              ],
            ),
          )
        ]),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
