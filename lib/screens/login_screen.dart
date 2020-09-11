import 'package:avarice/screens/home_screen.dart';
import 'package:avarice/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:avarice/widgets/textField_widget.dart';
import 'package:avarice/widgets/button_reuseable.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'LoginScreen';
  final AuthenticationService _authService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
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
                onPressed: () {
                  print('anon sing-in');
                 dynamic result = _authService.anonSignIn();
                 if(result != null){
                   print(result.toString());
                   Navigator.pushNamed(context, HomeScreen.id);
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
    );
  }
}