import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:registration_login/view/screens/Home_page.dart';
import 'package:registration_login/view/screens/Login_Page.dart';
import 'package:registration_login/view/screens/Singup_Page.dart';
import 'package:registration_login/view/screens/Splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isLogin = prefs.getBool('isLogin') ?? false;
  bool? singup = prefs.getBool('issignup') ?? false;

  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      // (singup == true)
      //     ? (isLogin == true)
      //         ? '/'
      //         : 'login_page'
      //     : 'signup_page',
      routes: {
        'splash': (context) => SplashPage(),
        '/': (context) => Home_Page(),
        'login_page': (context) => LoginPage(),
        'signup_page': (context) => SignupPage(),
      },
    ),
  );
}
