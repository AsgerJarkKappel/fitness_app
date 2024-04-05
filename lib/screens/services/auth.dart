import 'package:firebase_auth/firebase_auth.dart';

//Class responsible for handling authentication
class AuthService {
//_ (underscore means private)
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in anon
  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();

      return userCredential.user?.uid;
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

  //Register with email and password

  //sign out
}
