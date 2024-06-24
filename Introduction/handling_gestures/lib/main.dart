import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        appBar: AppBarWidget(),
        body: BodyWidget(),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.lightBlue,
      title: const Text("Handling gestures"),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<StatefulWidget> createState() => BodyStateFullWidget();
}

class BodyStateFullWidget extends State<BodyWidget> {
  int count = 0;
  void counterClicked() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const MyButton(),
        ElevatedButton(
            onPressed: counterClicked,
            onLongPress: () {
              setState(() {
                count = 0;
              });
            },
            child: const Text("Click Hare")),
        Padding(
          // Added padding for better spacing
          padding: const EdgeInsets.all(8.0),
          child: Text(count.toString()),
        ),
      ],
    ));
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Button was taped");
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.lightGreen[500],
        ),
        child: const Center(
          child: Text("Engage"),
        ),
      ),
    );
  }
}
