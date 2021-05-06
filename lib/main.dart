import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
    );
  }
}


class LandingPage extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        //If snapshot has error - Encountered an Error
        if(snapshot.hasError){
          return Scaffold(
            body: Center(
              child: Text("Error:  ${snapshot.error}"),
            ),
          );
        }

        // Connection to Firebase - Firebase App is running
        if(snapshot.connectionState == ConnectionState.done){
          return Scaffold(
            body: Center(
              child: Text("Firebase App Initialized")
            ),
          );
        }

        //Connecting to Firebase - App is Loading
        return Scaffold(
          body: Center(
            child: Text("Initializing App.."),
          ),
        );
      },
    );
  }
}

