import 'dart:async';

import 'package:avarice/screens/home/home_screen.dart';
import 'package:avarice/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:avarice/widgets/textField_widget.dart';
import 'package:avarice/widgets/button_reuseable.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:avarice/models/user_custom_model.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthenticationService _authService = new AuthenticationService();
  bool _isCalling = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _isCalling,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
                  child: SizedBox(
                    child: Icon(Icons.insert_emoticon),
                    height: 5.0,
                  ),
                ),
                ReuseableButton(
                  label: 'Anonymous Sign-in',
                  onPressed: () async {
                    //turn on CircularProgressIndicator
                    setState(() {
                      _isCalling = true;
                    });
                    dynamic result = await _authService.anonSignIn();
                    if (result == null) {
                      print('Error signing in');
                    } else {
                      print('$result has signed in.');
                    }
                    // turn off CircularProgressIndicator
                    if(this.mounted) {
                      setState(() {
                        _isCalling = false;
                      });
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 100.0, 0, 25.0),
                  child: SizedBox(
                    child: Icon(Icons.account_box),
                    height: 5.0,
                  ),
                ),
                CustomTextField(
                  labelText: 'E-mail',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  labelText: 'Password',
                ),
                SizedBox(
                  height: 20,
                ),
                ReuseableButton(
                  label: 'login',
                  onPressed: () {
                    print('login');
                    Navigator.pushNamed(context, HomeScreen.id);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
