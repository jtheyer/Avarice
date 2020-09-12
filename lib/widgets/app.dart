import 'package:avarice/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

///
/// Things initialized here...
///--FlutterFire (since realtime
/// data is essential)
/// --Provider (provides authentication stream to rest of widget tree)... use StreamPovider.value when I need to listen to a value (e.g. Has a User been returned or null been returned? i.e. is someone signed in or not)
///

class App extends StatelessWidget {
  // Create the initialization Future outside of build (Don't need context here)
  final Future<FirebaseApp> _initialize = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialize,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorWidget(snapshot.error);
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MyApp();
          }
          return CircularProgressIndicator(
            backgroundColor: Colors.orange,
          );
        });
  }
}
