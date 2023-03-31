import 'package:firebase_auth/firebase_auth.dart';
import 'package:slam_dunk_all_star_v2/models/auth.dart';
import 'package:flutter/material.dart';
import 'package:slam_dunk_all_star_v2/ui/screens/authentication/login_register_page.dart';
import 'package:slam_dunk_all_star_v2/ui/components/custom_decoration.dart';

class SignOutPage extends StatelessWidget {
  SignOutPage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Sign Out');
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton(context) {
    return ElevatedButton(
      onPressed: () {
        signOut();
        Navigator.popUntil(context, ModalRoute.withName("/"));
      },
      child: Text('Se déconnecter'),
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
          ],
        ),
      ),
    );
  }
}
