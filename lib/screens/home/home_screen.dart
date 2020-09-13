import 'package:avarice/services/authentication_service.dart';
import 'package:avarice/widgets/button_reuseable.dart';
import 'package:flutter/material.dart';
import 'package:avarice/models/user_custom_model.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "homeScreen";

  HomeScreen({this.currentUser});
  final UserCustom currentUser;

  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avarice'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Center(
              child: ReuseableButton(
                label: 'check result',
                onPressed: () {
                  print(currentUser);
                  print(currentUser.uid);
                },
              ),
            ),
            ReuseableButton(
              label: 'Sign-out',
              onPressed: () async{
                await _auth.signOut();
                print("signed out");
              },
            ),
          ],
        ),
      ),
    );
  }
}
