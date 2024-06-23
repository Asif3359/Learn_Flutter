import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "My Second App",
    debugShowCheckedModeBanner: false,
    home: SafeArea(
      child: MyScaffold(),
    ),
  ));
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          MyAppBar(
              title: Text(
            "Example Title",
            style: Theme.of(context).primaryTextTheme.titleMedium,
          )),
          const Expanded(
            child: Center(
              child: Text("Hello World"),
            ),
          )
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.title});
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          const IconButton(
              onPressed: null,
              tooltip: "Nevigation menu",
              icon: Icon(Icons.menu)),
          Expanded(child: title),
          const IconButton(
              onPressed: null,
              tooltip: "Search ",
              icon: Icon(Icons.search)),
        ],
      ),
    );
  }
}
