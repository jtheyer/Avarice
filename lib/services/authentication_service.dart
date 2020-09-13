import 'package:firebase_auth/firebase_auth.dart';
import 'package:avarice/models/user_custom_model.dart';
import 'package:flutter/material.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create a custom user (my model) from Firebase User
  UserCustom _userFromFirebase(User firebaseUser) {
    return firebaseUser != null
        ? UserCustom(uid: firebaseUser.uid, email: firebaseUser.email)
        : null;
  }

  // Subscribe to _auth's stream (to keep track of logged in/out state
  Stream<UserCustom> get authStream {
    // return _auth.authStateChanges().map((User user) => _userFromFirebase(user));
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  // Anonymous sign in function
  Future<UserCustom> anonSignIn() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print('Oops, sign-out error: ' + e);
      return null;
    }
  }

  Future createUserWithEmailAndPass(String email, String pass) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: email.trim(), password: pass.trim());
      return _userFromFirebase(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return Text('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return Text('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPass(String email, String pass) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.trim(), password: pass.trim());
      return _userFromFirebase(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
