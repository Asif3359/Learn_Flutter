import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late bool isShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Please login",
                        style: Heading(),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextFieldLabelStyle(),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                  style: BorderStyle.solid,
                                ))),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: TextFieldLabelStyle(),
                      ),
                      TextField(
                        obscureText: isShow,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.password),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.remove_red_eye),
                              onPressed: () {
                                setState(() {
                                  isShow = !isShow;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                  style: BorderStyle.solid,
                                ))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle TextFieldLabelStyle({
  double fontSize = 18.0,
  FontWeight fontWeight = FontWeight.bold,
  Color color = Colors.black,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle Heading({
  double fontSize = 30.0,
  FontWeight fontWeight = FontWeight.bold,
  Color color = Colors.black,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
