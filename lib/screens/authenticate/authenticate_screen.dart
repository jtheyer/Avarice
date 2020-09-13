import 'package:avarice/services/authentication_service.dart';
import 'package:avarice/widgets/button_reuseable.dart';
import 'package:avarice/widgets/register_form.dart';
import 'package:avarice/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AuthenticateScreen extends StatefulWidget {
  static String id = 'AuthenticateScreen';

  @override
  _AuthenticateScreenState createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  AuthenticationService _authService = AuthenticationService();

  bool showRegisterWidget = false;
  bool isCalling = false;
  Color newUserBtnColor = Colors.grey[300];

  void toggleRegWidget() {
    setState(() => showRegisterWidget = !showRegisterWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ModalProgressHUD(
          inAsyncCall: isCalling,
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
                        isCalling = true;
                      });
                      dynamic result = await _authService.anonSignIn();
                      if (result == null) {
                        print('Error signing in');
                      } else {
                        print('$result has signed in.');
                      }
                      // turn off CircularProgressIndicator
                      if (this.mounted) {
                        // note .this ref to this widgets state
                        setState(() {
                          isCalling = false;
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(80, 0, 0, 0),
                        child: Icon(
                          Icons.account_box,
                          size: 35,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 25, 0),
                        child: FlatButton(
                          onPressed: () {
                            toggleRegWidget();
                          },
                          child: showRegisterWidget == false
                              ? Text('New User')
                              : Text(
                                  'Sign-In',
                                  style: TextStyle(color: Colors.white70),
                                ),
                          color: showRegisterWidget == false
                              ? Colors.grey[300]
                              : Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  showRegisterWidget == false
                      ? _buildSignIn()
                      : _buildRegisterArea(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildSignIn() {
    return SignIn();
  }

  _buildRegisterArea() {
    return RegisterForm();
  }
}
