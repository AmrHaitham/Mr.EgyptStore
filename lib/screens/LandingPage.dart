// Developed by ENG Amr Haitham amro88981@gmail.com
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mr_egypt_store/Constants.dart';
import 'package:mr_egypt_store/screens/HomeScreen.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LandingPage extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text(
                "Initialization error : ${snapshot.error}",
                style: Constants.regularHeading,
              ),
            ),
          );
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          FirebaseAuth.instance.signInAnonymously();
          return Home();
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
          backgroundColor: Theme.of(context).accentColor,
          body: Center(
            child: Container(
              width: 80,
              height: 80,
              child: LoadingIndicator(
                indicatorType: Indicator.ballPulse,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}