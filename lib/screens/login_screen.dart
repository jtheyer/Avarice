import 'package:avarice/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:avarice/widgets/textField_widget.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'LoginScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Column(
          children: [
            SizedBox(
              child: Icon(Icons.accessibility),
              height: 100,
              width: 500,
            ),
            CustomTextField(labelText: 'E-mail',),
            SizedBox(
              height: 20,
            ),
            CustomTextField(labelText: 'Password',),
            SizedBox(
              height: 50,
            ),
            MaterialButton(onPressed: () {
              print('login');
              Navigator.pushNamed(context, HomeScreen.id);
            },
            child: Text('Login'),
            color: Colors.blueGrey,)
          ],
        ),
      ),
    );
  }
}