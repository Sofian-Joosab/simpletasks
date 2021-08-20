import 'package:e_commers/screens/constants.dart';
import 'package:e_commers/screens/home_page.dart';
import 'package:e_commers/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

          //StreamBuilder can check the state live
          return StreamBuilder(
            stream: FirebaseAuth.instance.onAuthStateChanged(),
            builder: (context, Streamsnapshot) {
              //If Streamsnapshot has error - Encountered an Error
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error:  ${Streamsnapshot.error}"),
                  ),
                );
              }


              //Checking the auth state
              return Scaffold(
                body: Center(
                  child: Text(
                    "Checking Auth.....",
                    style: Constants.regularHeading,
                  ),
                ),
              );
            },
          );
        }

        //Connecting to Firebase - App is Loading
        return Scaffold(
              body: Center(
              child: Text(
              "Initialization App.....",
            style: Constants.regularHeading,
          ),
          ),
          );
      },
    );
  }
}
