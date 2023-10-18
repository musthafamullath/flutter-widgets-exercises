import 'package:flutter/material.dart';
import 'package:sample1/main.dart';
import 'package:sample1/scereens/home.dart';
import 'package:sample1/scereens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          'https://yt3.googleusercontent.com/dNXHD2XSx1tKug2Qxmf7D20U3ctr35Um4eVZkJHtjv9OBwCb2WqFu3iWg5Mgg31KfnKWo3zthvs=s900-c-k-c0x00ffffff-no-rj',
          height: 300,
        ),
      ),
    );
  }

  Future<void> checkUserLoggedIn() async {
    final sharedprefs = await SharedPreferences.getInstance();
    final usedLoggedIn = sharedprefs.getBool(SAVE_KEY_NAME);
    if (usedLoggedIn == null || usedLoggedIn == false) {
      _gotoLogin();
    } else {
      Future.delayed(const Duration(seconds: 3),() => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx1) => const HomeScreen()),
      ) );
      // ignore: use_build_context_synchronously
      
    }
  }

  Future<void> _gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const LoginScreen()),
        );
      });
    });
  }
}
