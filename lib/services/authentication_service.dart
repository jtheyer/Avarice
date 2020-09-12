import 'package:firebase_auth/firebase_auth.dart';
import 'package:avarice/models/user_custom_model.dart';

class AuthenticationService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create a custom user (my model) from Firebase User
  UserCustom _userFromFirebase(User firebaseUser){
    return firebaseUser != null ? UserCustom(firebaseUser.uid) : null;
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
    }catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async{
    try {
      return await _auth.signOut();
    }catch(e){
      print('Oops, sign-out error: ' + e);
      return null;
    }
  }
}