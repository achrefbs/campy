import 'package:campi/helper/auth.helper.dart';
import 'package:campi/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return MaterialApp(home: Text("something went wrong!"));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => AuthHelper(),
                ),
              ],
              child: MaterialApp(
                home: HomeScreen(),
              ),
            );
          }
          return MaterialApp(home: Text("Loading"));
        });
  }
}
