import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/ui/components/cust_bttm_bar.dart';
import 'package:slam_dunk_all_star_v2/ui/components/custom_decoration.dart';
import 'package:slam_dunk_all_star_v2/ui/components/lists/list_teams.dart';

class AllTeamScreen extends StatefulWidget {
  const AllTeamScreen({super.key});

  @override
  State<AllTeamScreen> createState() => _AllTeamScreenState();
}

class _AllTeamScreenState extends State<AllTeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
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
              "Liste des équipes :",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: Container(
          decoration: CustomDecoration().customBackground(),
          child: const TeamListView()),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
