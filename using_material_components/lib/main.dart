import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "Material Component",
    home: MaterialComponent(),
  ));
}

class MaterialComponent extends StatefulWidget {
  const MaterialComponent({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MaterialComponentState createState() => _MaterialComponentState();
}

class _MaterialComponentState extends State<MaterialComponent> {
  int count = 0;

  void clickAdd() {
    setState(() {
      count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
            onPressed: null,
            tooltip: "Navigation menu",
            icon: Icon(Icons.menu)),
        title: const Text("Material Component"),
        actions: const [
          IconButton(
              onPressed: null,
              tooltip: "search options",
              icon: Icon(Icons.search)),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Hello Wrld"),
            Text(count.toString()),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 122, 171, 197),
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.black),
                  ),
                  onPressed: clickAdd,
                  icon: const Icon(
                    Icons.add,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
