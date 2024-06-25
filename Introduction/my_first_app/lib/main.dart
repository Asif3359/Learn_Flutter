import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarWidget(),
        body: BodyWidget(),
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
        "Appbar Title",
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
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
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Text("lorem ipsum "),
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
      color: Colors.amber,
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Footer Content" , style: TextStyle(color: Colors.white),),
            Text("Footer Content" , style: TextStyle(color: Colors.white),),

          ],
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
