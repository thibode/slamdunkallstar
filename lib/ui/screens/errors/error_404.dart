import 'package:flutter/material.dart';

class Error404 extends StatelessWidget {
  const Error404({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Row(
            children: const [Text("Ce que vous recherchez n'existe pas")],
          )
        ]),
      ),
    );
  }
}
