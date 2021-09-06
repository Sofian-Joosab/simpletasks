import 'package:e_commers/screens/constants.dart';
import 'package:e_commers/widgets/custm_btn.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 24.0,
                ),
                child:  Text("Welcome user, \nLogin to your account",
                textAlign: TextAlign.center,
                style: Constants.boldHeading,
                ),
              ),
              Text("input fields"),
              Custm_btn(
                text: "Create New Account",
                onPressed: () {
                  print("Clicked the Create New Account button");
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}
