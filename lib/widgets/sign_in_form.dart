import 'package:avarice/services/authentication_service.dart';
import 'package:avarice/widgets/button_reuseable.dart';
import 'package:avarice/widgets/textField_widget.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthenticationService _auth = AuthenticationService();

  String _email;
  String _pass;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextField(
            labelText: 'E-mail',
            onChanged: (val){
              this._email = val;
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            labelText: 'Password',
            onChanged: (val){
              this._pass = val;
            },
          ),
          SizedBox(
            height: 20,
          ),
          ReuseableButton(
            label: 'Sign-In',
            onPressed: () {
              print('login');
              _auth.signInWithEmailAndPass(_email, _pass);
            },
          ),
        ],
      )
    );
  }
}
