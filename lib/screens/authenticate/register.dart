import 'package:flutter/material.dart';
import 'package:flutter_fitness/screens/services/auth.dart';
import 'package:flutter_fitness/shared/loading.dart';

class Register extends StatefulWidget {
  const Register({super.key, required this.toggleView});

  final Function toggleView;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';

  //looading page state
  bool loading = false;

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
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                loading = false;
                                error = "Not a valid Email";
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
                        child: const Text('Register'),
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
