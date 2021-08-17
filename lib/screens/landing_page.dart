import 'package:e_commers/screens/constants.dart';
import 'package:e_commers/screens/home_page.dart';
import 'package:e_commers/screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        //If snapshot has error - Encountered an Error
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error:  ${snapshot.error}"),
            ),
          );
        }

        // Connection to Firebase - Firebase App is running fine
        if (snapshot.connectionState == ConnectionState.done) {
          return HomePage();
        }

        //Connecting to Firebase - App is Loading
        return LoginPage();
      },
    );
  }
}
