import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      routes: {
        '/home': (context) => const HomePage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool isShow = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = fullWidth < 600; // Threshold for small screens

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: fullWidth * 0.1), // 10% margin on both sides
            child: Column(
              children: [
                Row(
                  children: [
                    if (!isSmallScreen) // Conditionally hide the image container for small screens
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Image.network(
                            fit: BoxFit.cover,
                            width: 100,
                            "https://img.freepik.com/free-vector/access-control-system-abstract-concept_335657-3180.jpg?w=740&t=st=1719504324~exp=1719504924~hmac=6807802645709c2b5ded986eb017d7ec95dc50c50917def87b5cb1526dfac8e1",
                          ),
                        ),
                      ),
                    if (!isSmallScreen)
                      const SizedBox(
                          width:
                              20), // Adding space between the image and the form
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Heading
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
                            const SizedBox(
                                height:
                                    10), // Space between heading and email field

                            // Email Field
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
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                height:
                                    10), // Space between email and password field

                            // Password Field
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
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                height:
                                    10), // Space between password field and remember me checkbox

                            // Remember Me Checkbox
                            Container(
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked = !isChecked;
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  const Text("Remember password!")
                                ],
                              ),
                            ),
                            const SizedBox(
                                height:
                                    10), // Space between remember me checkbox and login/signup buttons

                            // Login and Signup Buttons
                            Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.deepPurple),
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/home');
                                      },
                                      child: const Row(
                                        children: [
                                          Text(
                                            "Login",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          SizedBox(width: 5),
                                          Icon(Icons.login)
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.deepPurple),
                                      ),
                                      onPressed: () {},
                                      child: const Row(
                                        children: [
                                          Text(
                                            "Signup",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          SizedBox(width: 5),
                                          Icon(Icons.logout)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                height:
                                    10), // Space between buttons and divider

                            // Divider
                            const Divider(
                              height: 10,
                              color: Colors.black,
                              thickness: 1,
                            ),
                            const SizedBox(
                                height:
                                    5), // Space between divider and social login button

                            // Social Login Button
                            Container(
                              child: Center(
                                child: TextButton(
                                  style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all(
                                        Colors.deepPurple),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "login with ",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(width: 5),
                                      Image.network(
                                        'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png', // URL of the Google logo
                                        width:
                                            24, // Adjust the size of the logo as needed
                                        height: 24,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Function to style text field labels
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

// Function to style headings
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

// Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.book),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.padding),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Home Page!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
