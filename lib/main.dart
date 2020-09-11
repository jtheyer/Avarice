import 'package:avarice/screens/home_screen.dart';
import 'package:avarice/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'widgets/app.dart';

// Run App class to initialize FlutterFire (since realtime data is essential) then run main application.
void main() {
  WidgetsFlutterBinding.ensureInitialized(); // ensureInitialized() needs to be called to initialize the FlutterFire plugin
  runApp(App());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown:  (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        } //..e.g. Clear keyboard by tapping somewhere else on the screen when a TextField has focus.
      },
      child: MaterialApp(
        title: 'Avarice',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: LoginScreen.id,
        routes: {
          HomeScreen.id : (context) => HomeScreen(),
          LoginScreen.id : (context) => LoginScreen(),
        }
      ),
    );
  }
}
