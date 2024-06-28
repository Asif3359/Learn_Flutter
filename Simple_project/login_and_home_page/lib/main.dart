import 'package:flutter/material.dart';
import 'package:login_and_home_page/homePage/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login and Home page Navigate",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LogInpage(),
    );
  }
}

class LogInpage extends StatefulWidget {
  const LogInpage({super.key});

  @override
  State<LogInpage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LogInpage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isShow = true;
  bool isLoggedIn = true;

  void _login() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;

      if (email == "a@gmail.com" && password == "1234") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        setState(() {
          isLoggedIn = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;
// Threshold for small screens

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: Container(
          margin: fullWidth < 600
              ? EdgeInsets.fromLTRB(20, 0, 20, 0)
              : EdgeInsets.fromLTRB(100, 0, 100, 0),
          width:
              fullWidth < 1007 && fullWidth > 600 ? fullWidth / 2 : fullWidth,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    if (!(fullWidth < 1007))
                      Expanded(
                        flex: 4,
                        child: Container(
                          height: fullWidth / 3,
                          child: Image.network(
                            fit: BoxFit.cover,
                            "https://img.freepik.com/free-vector/access-control-system-abstract-concept_335657-3180.jpg?w=740&t=st=1719504324~exp=1719504924~hmac=6807802645709c2b5ded986eb017d7ec95dc50c50917def87b5cb1526dfac8e1",
                          ),
                        ),
                      ),
                    if (!(fullWidth < 1007))
                      SizedBox(
                        width: fullWidth < 600 ? 20 : 100,
                      ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          const Text(
                            "Email :",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: const Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Password :",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: isShow,
                            decoration: InputDecoration(
                              labelText: 'Password',
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                          if (!isLoggedIn) // Display error message when login fails
                            Container(
                              margin: const EdgeInsets.only(top: 8.0),
                              child: const Text(
                                'Invalid email & password!',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Login and Signup Buttons
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: _login,
                                    child: const Row(
                                      children: [
                                        Text(
                                          "Login",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Icon(Icons.login)
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Row(
                                      children: [
                                        Text(
                                          "Signup",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Icon(Icons.login)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
