import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/ui/components/cust_bttm_bar.dart';
import 'package:slam_dunk_all_star_v2/ui/components/custom_decoration.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        decoration: CustomDecoration().customBackground(),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Bienvenue sur Slam Dunk All Star !",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Cette application va vous permettre de suivre les derniers résultat de la NBA, de voir les informations des joueurs, des équipes et de suivre les actualités.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
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
              child: const Card(),
            ),
            Container(
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
