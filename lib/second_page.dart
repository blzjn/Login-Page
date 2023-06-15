import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class SecondPage extends StatelessWidget {
  final String value;
  const SecondPage({required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 300,),
            Text('Welcome $value', style: TextStyle(fontSize: 50)),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (ctx) => LoginDemo()),
                          (route) => false);
                      final SharedPreferences pref =
                          await SharedPreferences.getInstance();

                      pref.clear();
                    },
                    child: Text('log out')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
