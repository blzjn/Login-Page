import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_3/main.dart';
import 'package:project_3/second_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  final TextEditingController _email_data = TextEditingController();
  final TextEditingController _pass_data = TextEditingController();
  TextEditingController clear_data = TextEditingController();

  bool passwordVisible=false;

  final _formKey = GlobalKey<FormState>();

  // bool visibilityChecker = true;

  @override
  Widget build(BuildContext context) {
    checkData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 0, bottom: 20),
                // padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: _email_data,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintText: 'Enter your name'),
                ),
              ),
              // Visibility(
              //   visible: !visibilityChecker,
              //   child: Text(
              //     'wrong password',
              //     style: TextStyle(color: Colors.red),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 0, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    } else if (value != _email_data.text) {
                      return 'Wrong Password';
                    }
                    return null;
                  },
                  controller: _pass_data,
                  obscureText: !passwordVisible,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your username as password',
                      
                      ),
                      
                      
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.9),
                child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          errorCheck();
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> setData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(save_key, _email_data.text);
  }

  Future<void> checkData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final checker = pref.getString(save_key);
    if (checker != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => SecondPage(
                value: checker,
              )));
    }
  }

  void errorCheck() {
    {
      if (_pass_data.text == _email_data.text) {
        setData();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => SecondPage(
                  value: _email_data.text,
                )));
      } 
      // else {
      //   setState(() {
      //     visibilityChecker = false;
      //   });
      // }
    }
  }
}
