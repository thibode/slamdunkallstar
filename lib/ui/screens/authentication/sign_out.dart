import 'package:firebase_auth/firebase_auth.dart';
import 'package:slam_dunk_all_star_v2/models/auth.dart';
import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/ui/components/custom_decoration.dart';

class SignOutPage extends StatelessWidget {
  SignOutPage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Déconnexion');
  }

  Widget _userUid() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: const Text(
        'Êtes-vous sur de vouloir vous déconnecter ?',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _signOutButton(context) {
    return ElevatedButton(
      onPressed: () {
        signOut();
        Navigator.popUntil(context, ModalRoute.withName("/"));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        textStyle: const TextStyle(fontSize: 16),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Text('Se déconnecter'),
    );
  }

  Widget _backHomeButton(context) {
    var route = ModalRoute.of(context);
    return MaterialButton(
      child: const Icon(
        Icons.cancel_sharp,
        color: Colors.white,
      ),
      onPressed: () {
        if (route?.settings.name != "/") {
          Navigator.pushNamed(context, "/");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: _title(),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: CustomDecoration().customBackground(),
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _userUid(),
            _signOutButton(context),
            _backHomeButton(context),
          ],
        ),
      ),
    );
  }
}
