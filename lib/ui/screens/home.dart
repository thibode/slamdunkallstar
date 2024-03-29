import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/models/players.dart';
import 'package:slam_dunk_all_star_v2/repository/players_repository.dart';
import 'package:slam_dunk_all_star_v2/ui/components/cust_bttm_bar.dart';
import 'package:slam_dunk_all_star_v2/ui/components/custom_decoration.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/search_player.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<Player>? _searchResults;
  Future<List<Player>> searchPlayer(String playerName) async {
    return await PlayerRepository().searchPlayer(playerName);
  }

  final TextEditingController _searchController = TextEditingController();

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
              "Accueil",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: CustomDecoration().customBackground(),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              child: TextField(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchPlayerView()));
                  },
                  readOnly: true,
                  controller: _searchController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintStyle: const TextStyle(color: Colors.white),
                    hintText: "Rechercher le nom d'un joueur",
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  )),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: const [
                    Text(
                      "Bienvenue sur Slam Dunk All Star !",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Cette application va vous permettre de suivre les derniers résultat de la NBA, de voir les informations des joueurs, des équipes et de suivre les actualités de la ligue.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                "Sites références sur la NBA :",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _launchUrl('https://www.nba.com/');
                      },
                      child: Image.asset(
                        'assets/images/pngegg.png',
                        height: 150,
                        width: 100,
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        _launchUrl('https://www.espn.co.uk/nba/');
                      },
                      child: Image.asset(
                        'assets/images/espn-png-logo-4144.png',
                        height: 150,
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: const Card(),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _launchUrl('https://www.instagram.com/nba/');
                    },
                    child: Image.asset(
                      'assets/images/icons8-instagram-48.png',
                      height: 150,
                      width: 100,
                    ),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      _launchUrl('https://twitter.com/NBA');
                    },
                    child: Image.asset(
                      'assets/images/icons8-twitter-48.png',
                      height: 150,
                      width: 100,
                    ),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      _launchUrl('https://www.youtube.com/@NBA');
                    },
                    child: Image.asset(
                      'assets/images/youtube-logo-png-2069.png',
                      height: 150,
                      width: 100,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
