import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:registration_login/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home_Page(),
  ));
}

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();

              await prefs.remove('isLogin');

              Navigator.of(context)
                  .pushNamedAndRemoveUntil('login_page', (route) => false);
            },
            icon: Icon(Icons.power_settings_new),
          ),
        ],
        centerTitle: true,
      ),
    );
  }
}
