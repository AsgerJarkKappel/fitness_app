import 'package:flutter/material.dart';
import 'package:flutter_fitness/screens/services/auth.dart';

class Register extends StatefulWidget {
  const Register({super.key, required this.toggleView});

  final Function toggleView;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';
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
          "Sign up",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'Arial',
              letterSpacing: 3,
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                widget.toggleView();
              },
              icon: const Icon(Icons.shopping_bag_rounded))
        ],
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
                  child: const Text('Registor'),
                )
              ],
            ),
          )),
    );
  }
}
