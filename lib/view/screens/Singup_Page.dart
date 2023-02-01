import 'package:flutter/material.dart';
import 'package:registration_login/view/Globals/Globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController usernamecontrollar = TextEditingController();
  TextEditingController passwordcontrollar = TextEditingController();
  TextEditingController confirmpasswordcontrollar = TextEditingController();
  TextEditingController emailcontrollar = TextEditingController();

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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 30),
                  const Text(
                    "Signup",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 30),
                      TextFormField(
                        controller: usernamecontrollar,
                        validator: (val){
                          if(val!.isEmpty){
                            return "Enter Name...";
                          }else{
                            return null;
                          }
                        },
                        onSaved: (val){
                          setState(() {
                            Globals.username = (val);
                          });
                        },
                        onChanged: (val){
                          setState(() {
                            Globals.username = val;
                          });
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
                        validator: (val){
                          if(val!.isEmpty){
                            return "Enter Email...";
                          }else{
                            return null;
                          }
                        },
                        onSaved: (val){
                          setState(() {
                            Globals.email = (val);
                          });
                        },
                        onChanged: (val){
                          setState(() {
                            Globals.email = val;
                          });
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
                        validator: (val){
                          if(val!.isEmpty){
                            return "Enter Password...";
                          }else{
                            return null;
                          }
                        },
                        onSaved: (val){
                          setState(() {
                            Globals.password = (val);
                          });
                        },
                        onChanged: (val){
                          setState(() {
                            Globals.password = val;
                          });
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
                      const SizedBox(height: 30),
                      TextFormField(
                        validator: (val){
                          if(val!.isEmpty){
                            return "Enter password...";
                          }else{
                            return null;
                          }
                        },
                        onSaved: (val){
                          setState(() {
                            Globals.password = (val);
                          });
                        },
                        onChanged: (val){
                          setState(() {
                            Globals.password = val;
                          });
                        },
                        controller: confirmpasswordcontrollar,
                        decoration: InputDecoration(
                          fillColor: Colors.white.withOpacity(0.9),
                          filled: true,
                          hintText: "Confirm Password",
                          labelText: 'Confirm Password',
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
                          if (usernamecontrollar.text == Globals.username &&
                              passwordcontrollar.text == Globals.password &&
                              confirmpasswordcontrollar.text == Globals.password &&
                              emailcontrollar.text ==
                                  Globals.email) {
                            SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                            await prefs.setBool('issignup', true);

                            Navigator.of(context).pushReplacementNamed('/');
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 15,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 6,
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
                            onPressed: () {},
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
                      SizedBox(height: 90),
                      const Text(
                        "Already have an account! ",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        "Login",
                        style:
                        TextStyle(color: Colors.green[400], fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
