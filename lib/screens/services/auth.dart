import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_fitness/models/user.dart';

//Class responsible for handling authentication
class AuthService {
//_ (underscore means private)
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user obj based on Firebaseuser

  UserObject? _userFromFireBaseUser(User? user) {
    return user != null ? UserObject(uid: user.uid) : null;
  }

  //Auth change user stream
  //Will send a userobject down the stream if user logged in
  //Will send null value down the stream when user signs out
  Stream<UserObject?> get userStream {
    return _auth.authStateChanges().map(_userFromFireBaseUser);
  }

  // Sign in anon
  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();

      User user = userCredential.user!;
      return _userFromFireBaseUser(user);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }

  //Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;

      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = result.user!;

      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOutUser() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
