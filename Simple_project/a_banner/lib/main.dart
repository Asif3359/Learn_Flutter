import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

// My App class

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Disine a banner",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Design A banner"),
          backgroundColor: Colors.lightBlue,
        ),
        body: const SingleChildScrollView(child: BodyWidget()),
      ),
    );
  }
}

// class My body BodyWidget

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(50, 0, 50, 5),
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
            ),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.green,
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.black.withOpacity(0.5),
                    child: const Text(
                      'Welcome to Flutter',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(50, 5, 50, 5),
          child: Center(
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      color: Colors.lightBlue,
                      height: 500,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Left Content"),
                        ],
                      ),
                    )),
                const Divider(
                  thickness: 12,
                  indent: 12,
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: const Color.fromARGB(255, 211, 169, 43),
                      width: double.infinity,
                      height: 500,
                      child: const Center(child: Text("Left Content")),
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
