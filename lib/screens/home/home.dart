import 'package:flutter/material.dart';
import 'package:flutter_fitness/screens/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.yellow,
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                await _auth.signOutUser();
              },
              icon: const Icon(Icons.person))
        ],
      ),
    );
  }
}
