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
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, Streamsnapshot) {
              //If Streamsnapshot has error - Encountered an Error
              if (Streamsnapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error:  ${Streamsnapshot.error}"),
                  ),
                );
              }

              //Connection state active - Do the user login check inside the if statement

              if(Streamsnapshot.connectionState == ConnectionState.active) {

                // Get the user
                User _user = Streamsnapshot.data;

                //if the user is null, we're not logged in
                if(_user == null){

                  //user not logged in, head to loggin page
                  return LoginPage();
                }else {
                  //The user is logged in, head to home page
                  return HomePage();
                }

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
