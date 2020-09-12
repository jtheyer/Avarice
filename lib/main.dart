import 'package:avarice/models/user_custom_model.dart';
import 'package:avarice/screens/wrapper.dart';
import 'package:avarice/services/authentication_service.dart';
import 'package:provider/provider.dart';

import 'screens/authenticate/authenticate_screen.dart';
import 'screens/authenticate/login_screen.dart';
import 'screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'widgets/app.dart';

///
/// App class initialized things like... (see App class)
///

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // ensureInitialized() needs to be called to initialize the FlutterFire plugin
  runApp(App());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        } //..e.g. Clear keyboard by tapping somewhere else on the screen when a TextField has focus.
      }, //StreamProvider.value wouldn't work if declared above this position on widget tree... ??
      child: StreamProvider<UserCustom>.value(
        value: AuthenticationService().authStream,
        child: MaterialApp(
            title: 'Avarice',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            initialRoute: Wrapper.id,
            routes: {
              Wrapper.id: (context) => Wrapper(),
              AuthenticateScreen.id: (context) => AuthenticateScreen(),
              HomeScreen.id: (context) => HomeScreen(),
              LoginScreen.id: (context) => LoginScreen(),
            }),
      ),
    );
  }
}
