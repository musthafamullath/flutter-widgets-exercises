import 'package:flutter/material.dart';
import 'package:sample1/scereens/splash.dart';

// ignore: constant_identifier_names
const SAVE_KEY_NAME = 'UserLoggedIn';

void main() {
  runApp(const MyApp());
}

class MyApp  extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sample login',
      theme:ThemeData(
        primaryColor: Colors.black,
        
      ),
      home: const SplashScreen(),
    );
  }
}

