import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:registration_login/helpers/firebase_auth_helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final signUpFormKey = GlobalKey<FormState>();
  TextEditingController usernamecontrollar = TextEditingController();
  TextEditingController passwordcontrollar = TextEditingController();
  TextEditingController confirmpasswordcontrollar = TextEditingController();
  TextEditingController emailcontrollar = TextEditingController();
  var email;
  var pass;

  void ValidEmail() {
    final bool isvalid = EmailValidator.validate(emailcontrollar.text.trim());

    if (isvalid) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Valid Email")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Not a Valid Email")));
    }
  }

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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 80),
                const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Form(
                  key: signUpFormKey,
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      TextFormField(
                        controller: usernamecontrollar,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter user Name...';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          pass = val;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white.withOpacity(0.9),
                          filled: true,
                          hintText: "User name",
                          labelText: 'User Name',
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
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: emailcontrollar,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter Email...';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          pass = val;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white.withOpacity(0.9),
                          filled: true,
                          hintText: "Email",
                          labelText: 'Email address',
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
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: passwordcontrollar,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter password...';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          pass = val;
                        },
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
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            "Format Password?",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () async {
                          ValidEmail();
                          // if (signUpFormKey.currentState!.validate()) {
                          //   signUpFormKey.currentState!.save();
                          User? user =
                              await firebaseAuthhelper.FirebaseAuthhelper
                                  .signUp(
                                      email: emailcontrollar.text,
                                      password: passwordcontrollar.text);

                          if (User != Null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Sign Up succcess..."),
                                backgroundColor: Colors.green,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                            Navigator.of(context).pushReplacementNamed('/');
                          } else {
                            Navigator.of(context).pop();

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Sign Up Failad..."),
                              ),
                            );
                          }
                          // }
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
                            "Sign up",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: const [
                          Text(
                            "---------------------------",
                            style: TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                          Text(
                            "Or signup with",
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
                            onPressed: () async {
                              User? user = await firebaseAuthhelper
                                  .FirebaseAuthhelper.signInAnnonymously();
                              if (user != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Login successful..."),
                                    backgroundColor: Colors.green,
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                                Navigator.of(context).pushReplacementNamed('/');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Faild"),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              }
                            },
                            child: const Icon(
                              Icons.group_sharp,
                              size: 30,
                              color: Colors.white,
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 9),
                                textStyle: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              Map<String, dynamic> res =
                                  await firebaseAuthhelper.FirebaseAuthhelper
                                      .signInWithGoogle();
                              if (res['user'] != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Login successful..."),
                                    backgroundColor: Colors.green,
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                                Navigator.of(context).pushReplacementNamed('/');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Faild"),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              }
                            },
                            child: const Icon(Icons.g_mobiledata,
                                size: 40, color: Colors.white),
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 90),
                    const Text(
                      "Already have an account! ",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "login_page");
                      },
                      child: Text(
                        "Login",
                        style:
                            TextStyle(color: Colors.green[400], fontSize: 16),
                      ),
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
