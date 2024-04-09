import 'package:flutter/material.dart';
import 'package:flutter_fitness/screens/authenticate/register.dart';
import 'package:flutter_fitness/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

//works as a wrapper for sign in and registor
class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  //Start on show in, changes pages
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      //pass the functions to the "wrapped" objects for use
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
