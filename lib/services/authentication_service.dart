import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Anonymous sign in function
  Future<User> anonSignIn() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user;
      return user;
    }catch(e) {
      print(e.toString());
      return null;
    }

  }
}