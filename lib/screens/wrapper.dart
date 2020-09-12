import 'package:avarice/models/user_custom_model.dart';
import 'package:avarice/screens/authenticate/authenticate_screen.dart';
import 'package:avarice/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:avarice/services/authentication_service.dart';
import 'package:provider/provider.dart';

///
/// Wrapper chooses what screen to display based on whether a user
/// is logged in or not. If logged in then display HomeScreen() (Anon
/// sign-in counts as logged in). If not logged in then display
/// AuthenticateScreen().
///

class Wrapper extends StatefulWidget {
  static String id = 'wrapperScreen';

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  @override
  Widget build(BuildContext context) {
    final userCustom = Provider.of<UserCustom>(context);

    if (userCustom == null) {
      return AuthenticateScreen();
    } else {
      return HomeScreen(currentUser: userCustom,);
    }
  }
}
