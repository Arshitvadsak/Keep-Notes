import 'package:flutter/material.dart';
import 'package:registration_login/view/screens/Home_page.dart';
import 'package:registration_login/view/screens/Login_Page.dart';
import 'package:registration_login/view/screens/Singup_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isLogin = prefs.getBool('isLogin') ?? false;
  bool? singup = prefs.getBool('issignup') ?? false;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (singup == true)
          ? (isLogin == true)
              ? '/'
              : 'login_page'
          : 'signup_page',
      routes: {
        '/': (context) => Home_Page(),
        'login_page': (context) => LoginPage(),
        'signup_page': (context) => SignupPage(),
      },
    ),
  );
}
