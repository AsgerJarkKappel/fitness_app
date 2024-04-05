import 'package:flutter/material.dart';
import 'package:flutter_fitness/screens/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.blue,

        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.

        title: const Text(
          "Sign in",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'Arial',
              letterSpacing: 3,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: TextButton(
            child: Text('Sign in anon button'),
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                print('Error signing in fuck fuck');
              } else {
                print('Signed in lol');
                print(result);
              }
            },
          )),
    );
  }
}
