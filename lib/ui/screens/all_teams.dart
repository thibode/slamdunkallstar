import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/ui/components/cust_bttm_bar.dart';
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
        title: const Text("NBA Teams List"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: const TeamListView(),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
