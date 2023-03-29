import 'package:firebase_auth/firebase_auth.dart';
import 'package:slam_dunk_all_star_v2/models/auth.dart';
import 'package:flutter/material.dart';

class SignOutPage extends StatelessWidget {
  SignOutPage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Test');
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton(context) {
    return ElevatedButton(
        onPressed: signOut,
        child: MaterialButton(onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName("/signIn"));
        }));
  }

// Navigator.popUntil(context, ModalRoute.withName("/signOut"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        automaticallyImplyLeading: false,
      ),
      body: Container(
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
