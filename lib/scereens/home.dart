import 'package:flutter/material.dart';
import 'package:sample1/main.dart';
import 'package:sample1/scereens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(backgroundColor: Colors.black),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 10,
        centerTitle: true,
        title: const Text(
          "HOME",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 30,
            fontFamily: 'musthafa font',
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _showAlertDialog(context);
              },
              icon: const Icon(Icons.exit_to_app)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          colour(context);
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            if (index % 2 == 0) {
              // The item is even, so return a rounded image.
              return ListTile(
                title: Text('person $index'),
                subtitle: Text('message $index'),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcT9XT89rHOJLr7fOg3wSlQLss0SVKd11QLerGhgXq2ZBB2IGGN1',
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,
                  ),
                ),
                trailing: Text('1$index: PM'),
              );
            } else {
              // The item is odd, so return a squared image.
              return ListTile(
                title: Text('person $index'),
                subtitle: Text('message $index'),
                leading: ClipRRect(
                  borderRadius: BorderRadius.zero,
                  child: Image.network(
                    'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcT9XT89rHOJLr7fOg3wSlQLss0SVKd11QLerGhgXq2ZBB2IGGN1',
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,
                  ),
                ),
                trailing: Text('1$index: PM'),
              );
            }
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: 30,
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
            "Logout Confirmation",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'musthafa font',
            ),
          ),
          content: const Text(
            "Are you sure you want to logout?",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'musthafa font',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                logout(context);
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  Future<void> logout(BuildContext context) async {
    final sharedprefs = await SharedPreferences.getInstance();
    await sharedprefs.setBool(SAVE_KEY_NAME, false);

    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  void colour(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'I am an add Icon',
          style: TextStyle(fontFamily: 'musthafa font'),
        ),
        margin: EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
