import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_fitness/loading.dart';
import 'package:flutter_fitness/screens/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key, required this.toggleView});

  final Function toggleView;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
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
              actions: <Widget>[
                IconButton(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: const Icon(Icons.shopping_bag_rounded))
              ],
            ),
            body: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Form(
                  //Associate form key with form
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 20.0),
                      TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? 'Enter an email' : null,
                        //update the value of email when ever it changes
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                          validator: (value) => value!.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
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
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error =
                                    "Could not sign in, check email or password";
                                loading = false;
                              });
                            }
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors
                              .pink), // sets the background color of the button
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors
                                  .white), // sets the text color of the button
                        ),
                        child: const Text('Sign in'),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(error,
                          style: const TextStyle(
                              color: Colors.red, fontSize: 14.0))
                    ],
                  ),
                )),
          );
  }
}
