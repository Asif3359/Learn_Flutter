import 'package:flutter/material.dart';
import 'package:login_and_home_page/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _logOut() {
    setState(() {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LogInpage()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            children: [
              Text("Home"),
              TextButton(
                onPressed:_logOut,
                child: const Row(
                  children: [
                    Text(
                      "Logout",
                      style: TextStyle(fontSize: 18),
                    ),
                    Icon(Icons.login)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Home Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
