import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "List and Grid",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text("List and grid"),
        ),
        body: const SingleChildScrollView(
          child: BodyWidget(),
        ),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Horizontal list",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 70,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: const [
              SizedBox(
                width: 200,
                child: ListTile(
                  leading: Icon(Icons.map),
                  title: Text("Map"),
                ),
              ),
              SizedBox(
                width: 200,
                child: ListTile(
                  leading: Icon(Icons.album),
                  title: Text("Album"),
                ),
              ),
              SizedBox(
                width: 200,
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text("Phone"),
                ),
              ),
            ],
          ),
        ),
        const Text(
          "Vertical list",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          child: ListView(
            shrinkWrap: true,
            children: const [
              ListTile(
                leading: Icon(Icons.map),
                title: Text("Map"),
              ),
              ListTile(
                leading: Icon(Icons.album),
                title: Text("Album"),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text("Phone"),
              ),
            ],
          ),
        ),
        const Text(
          "Grid list",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        Container(
          child: GridView.count(
            crossAxisCount: 10,
            shrinkWrap: true,
            children: List.generate(50, (index) {
              return Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    'Item $index',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              );
            }),
          ),
        ),
        const Text(
          "Mixed list",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Container(
          child: MyMixedList(
            items: List<ListItem>.generate(
              100,
              (i) => i % 6 == 0
                  ? HeadingItem('Heading $i')
                  : MessageItem('Sender $i', 'Message body $i'),
            ),
          ),
        ),
        const Text(
          "list with space",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Container(
          height: 400,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: List.generate(
                      4,
                      (index) => ItemWidget(
                          text:
                              'Item $index'), // Ensure ItemWidget is defined or imported
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const Text(
          "long lists",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 300,
          child: MyLongList(
            items: List<String>.generate(10000, (i) => 'Item $i'),
          ),
        ),

        // Add more widgets here if needed
      ],
    );
  }
}

class MyLongList extends StatelessWidget {
  final List<String> items;
  const MyLongList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        prototypeItem: ListTile(
          title: Text(items.first),
        ),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
          );
        });
  }
}

class ItemWidget extends StatelessWidget {
  final String text;
  const ItemWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Center(child: Text(text)),
      ),
    );
  }
}

class MyMixedList extends StatelessWidget {
  const MyMixedList({super.key, required this.items});
  final List<dynamic> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: item.buildTitle(context),
            subtitle: item.buildSubtitle(context),
          );
        },
      ),
    );
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}
