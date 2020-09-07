import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "homeScreen";

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
              child: Text('HomeScreen'),
              
            ),
            MaterialButton(onPressed: (){
              Navigator.pop(context);
            },
            child: Text('Back'),)
          ],
        ),
      ),
    );
  }
}
