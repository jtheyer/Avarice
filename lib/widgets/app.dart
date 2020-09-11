import 'package:avarice/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class App extends StatelessWidget {
  // Create the initialization Future outside of build
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