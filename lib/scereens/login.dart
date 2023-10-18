import 'package:flutter/material.dart';
import 'package:sample1/main.dart';
import 'package:sample1/scereens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = "musthafa";

  final password = "123456";

  final _userNameController = TextEditingController();

  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 10,
          centerTitle: true,
          title: const Text(
            'LOGIN PAGE',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 30,
              fontFamily: 'musthafa font',
            ),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _userNameController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText: 'Username',
                      hintText: 'eg: will smith',
                      helperText: 'Please enter your username',
                      icon: Icon(
                        Icons.account_box,
                        color: Colors.black,
                      ),
                      contentPadding: EdgeInsets.all(10),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'value is empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    labelText: 'Password',
                    hintText: 'eg: 123456',
                    helperText: 'Please enter your password',
                    icon: Icon(
                      Icons.password,
                      color: Colors.black,
                    ),
                    contentPadding: EdgeInsets.all(10),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          checklogin(context);
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 1.5, color: Colors.black),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        textStyle: const TextStyle(color: Colors.black),
                      ),
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checklogin(BuildContext c) async {
    final userName = _userNameController.text;
    final passWord = _passwordController.text;
    if (userName == username && passWord == password) {
      final sharedprefs = await SharedPreferences.getInstance();
      await sharedprefs.setBool(SAVE_KEY_NAME, true);
      // ignore: use_build_context_synchronously
      Navigator.of(c).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
    } else {
      showDialog(
        context: c,
        builder: (context) => AlertDialog(
          title: const Text(
            'Invalid login information',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'musthafa font',
            ),
          ),
          backgroundColor: Colors.black,
          content: const Text(
            'Please check your username and password and try again.',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'musthafa font',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    }
  }
}
