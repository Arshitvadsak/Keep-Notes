import 'package:flutter/material.dart';
import 'package:registration_login/view/Globals/Globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Singup_Page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailcontrollar = TextEditingController();
  TextEditingController passwordcontrollar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: const Image(
              image: AssetImage(
                "assets/images/unsplash.png",
              ),
              height: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: emailcontrollar,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        fillColor: Colors.white.withOpacity(0.9),
                        filled: true,
                        hintText: "Email",
                        labelText: 'Email',
                        labelStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: passwordcontrollar,
                      decoration: InputDecoration(
                        fillColor: Colors.white.withOpacity(0.9),
                        filled: true,
                        hintText: "Password",
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Remember me",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Format Password?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () async {
                        if (emailcontrollar.text == Globals.email &&
                            passwordcontrollar.text == Globals.password) {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();

                          await prefs.setBool('isLogin', true);
                          Navigator.of(context).pushReplacementNamed('/');
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width * 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green[400],
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: () async {
                    //     if (usernamecontrollar.text == 'ArshitVadsak' &&
                    //         passwordcontrollar.text == '123456789') {
                    //       SharedPreferences prefs =
                    //           await SharedPreferences.getInstance();
                    //
                    //       await prefs.setBool('isLogin', true);
                    //
                    //       Navigator.of(context).pushReplacementNamed('/');
                    //     }
                    //   },
                    //  child: Text("Log in"),
                   // ),
                    const SizedBox(height: 30),
                    Row(
                      children: const [
                        Text(
                          "---------------------------",
                          style: TextStyle(color: Colors.white),
                        ),
                        Spacer(),
                        Text(
                          "Or login with",
                          style: TextStyle(color: Colors.white),
                        ),
                        Spacer(),
                        Text(
                          "---------------------------",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.apple,
                            size: 30,
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 9),
                              textStyle: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.facebook_outlined,
                            size: 30,
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 9),
                              textStyle: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupPage(),
                              ),
                            );
                          },
                          child: const Icon(Icons.g_mobiledata, size: 40),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 3),
                              textStyle: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      "Singup",
                      style: TextStyle(color: Colors.green[400], fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
