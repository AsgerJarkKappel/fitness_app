import 'package:flutter/material.dart';
import 'package:flutter_fitness/models/user.dart';
import 'package:flutter_fitness/screens/authenticate/authenticate.dart';
import 'package:flutter_fitness/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserObject?>(context);

    // Return either home or authentication widget based on user authentication status
    return user == null ? const Authenticate() : Home();
  }
}
