import 'package:avarice/screens/home/home_screen.dart';
import 'package:avarice/services/authentication_service.dart';
import 'package:avarice/widgets/button_reuseable.dart';
import 'package:avarice/widgets/textField_widget.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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
                _email = val;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              labelText: 'Password',
              onChanged: (val){
                _pass = val;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ReuseableButton(
              label: 'Sign-Up',
              color: Colors.teal[800],
              onPressed: () async {
                print('signUP..');
                await _auth.createUserWithEmailAndPass(_email, _pass);
              },
            ),
          ],
        )
    );
  }
}
