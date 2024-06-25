import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Layout Demo",
      home: Scaffold(
        appBar: AppBarWidget(),
        body: SingleChildScrollView(
          // Wrap the body with SingleChildScrollView
          child: BodyWidget(),
        ),
        bottomNavigationBar: FooterWidget(),
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
      title: const Text(
        "Flutter Layout Demo",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSection(),
          RatingSection(),
          ShareSection(),
          DescriptionSection(),
        ],
      ),
    );
  }
}

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.black26,
      padding: const EdgeInsets.all(10),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Its App Footer"),
        ],
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      height:
          MediaQuery.of(context).size.height * 0.4, // Adjust height as needed
      width: MediaQuery.of(context).size.width, // Adjust width as needed
      'assets/images/lake.jpg',
      fit: BoxFit.cover,
    );
  }
}

class RatingSection extends StatelessWidget {
  const RatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
    return Container(
      margin: const EdgeInsets.all(15),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Oeschinen Lake Campground",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                Text("Kandersteg, Switzerland"),
              ],
            ),
          ),
          Icon(Icons.star),
          Padding(padding: EdgeInsets.all(10)),
          Text("41"),
        ],
      ),
    );
  }
}

class ShareSection extends StatelessWidget {
  const ShareSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: const SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonWithText(
              icon: Icons.call,
              color: Colors.lightBlue,
              label: "Call",
            ),
            ButtonWithText(
              icon: Icons.route,
              color: Colors.lightBlue,
              label: "Route",
            ),
            ButtonWithText(
              icon: Icons.share,
              color: Colors.lightBlue,
              label: "Share",
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText(
      {super.key,
      required this.icon,
      required this.color,
      required this.label});

  final IconData icon;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Text(label),
        ],
      ),
    );
  }
}

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Text(
            "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it  is one of the larger AlpineLakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.",
            style: TextStyle(fontSize: 12, inherit: true)),
      ),
    );
  }
}
