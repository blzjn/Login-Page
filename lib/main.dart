import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'login_page.dart';

const save_key = '';
void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}