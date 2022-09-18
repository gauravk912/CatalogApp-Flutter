// ignore_for_file: prefer_const_constructors
import 'package:catalog/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // await Future.delayed(Duration(seconds: 0.2));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
    }
  }

  Widget build(BuildContext context) {
    return Material(
      // child: Center(
      //     child: Text("Login Page",
      //         style: TextStyle(
      //           fontSize: 20,
      //           color: Colors.blue,
      //           fontWeight: FontWeight.bold,
      //         ),
      //         textScaleFactor: 3.0,
      //         )),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 70.0,
              ),
              Image.asset(
                "assets/images/secure_login.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter username",
                        labelText: "Username",
                      ),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be Empty";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, MyRoutes.homeRoute);
                    moveToHome(context);
                  },
                  style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
