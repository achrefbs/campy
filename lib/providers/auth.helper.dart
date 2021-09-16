import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthHelper with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  get currentUser => auth.currentUser;

  attemptSignUp(email, password, passwordConfirmation) async {
    print(
      "email = $email\npassword = $password\npassword confirmation = $passwordConfirmation",
    );
    if (!(password == passwordConfirmation)) {
      print('Passwords doesn\'t match');
    } else {
      try {
        // ignore: unused_local_variable
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  attemptLogin(email, password) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
