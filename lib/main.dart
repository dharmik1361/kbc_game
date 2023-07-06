// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(KBClogin());

class KBClogin extends StatelessWidget {
  const KBClogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "KBC GAME",
      theme: ThemeData(primaryColor: Color(0xff2d1642)),
      home: KBCloginpage(),
    );
  }
}

class KBCloginpage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2d1642),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Center(
                  child: Image.asset(
                "image/kbc.jpg",
                height: 130,
              )),
              TextField(
                style: TextStyle(color: Colors.white60),
                controller: usernameController,
                decoration: InputDecoration(
                    labelText: "Username", prefixIcon: Icon(Icons.person)),
              ),
              TextField(
                style: TextStyle(color: Colors.white60),
                controller: passwordController,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: "Password",
                    prefixIcon: Icon(Icons.password)),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  String name = usernameController.text;
                  String pass = passwordController.text;

                  if (name.isNotEmpty && pass.isNotEmpty) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => KBCGAME()));
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Login fail"),
                            content: Text(
                                "Please enter a valid username and password"),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text("ok"))
                            ],
                          );
                        });
                  }
                },
                child: Text("Let's play"),
              ),
              SizedBox(height: 24),
              TextButton(
                onPressed: () {},
                child: Text('Forgot Password?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
