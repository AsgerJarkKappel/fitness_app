import 'package:flutter/material.dart';
import 'package:flutter_fitness/screens/authenticate/authenticate.dart';
import 'package:flutter_fitness/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //Return either home or authentication widget
    return const Authenticate();
  }
}
