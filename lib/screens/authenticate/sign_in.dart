import 'package:flutter/material.dart';
import 'package:flutter_fitness/screens/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key, required this.toggleView});

  final Function toggleView;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  //text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () {
                widget.toggleView();
              },
              icon: const Icon(Icons.app_registration))
        ],
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
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20.0),
                TextFormField(
                  //update the value of email when ever it changes
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                    obscureText: true,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    }),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  //Async because of Firebase communication takes time
                  onPressed: () async {
                    //change later fore interaction with firebase
                    print(email);
                    print(password);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.pink), // sets the background color of the button
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white), // sets the text color of the button
                  ),
                  child: const Text('Sign in'),
                )
              ],
            ),
          )),
    );
  }
}
