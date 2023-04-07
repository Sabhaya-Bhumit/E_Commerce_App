import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:home_service_app/helper/firebase_auth_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../helper/firebase_auth_helper.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

String? email;
String? password;

bool ispassword = true;
bool Remember = false;

class _login_pageState extends State<login_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Remember = false;
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _widht = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Center(
                  child: Text("You Have Exit"),
                ),
                content: Text("Welcome Back"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text("Yes")),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text("No")),
                ],
              )),
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: _height * 0.05),
                Text("    Hi,Welcome Back! 👋",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Center(
                  child: Image.asset("assets/images/Authentication-rafiki.png",
                      height: 250),
                ),
                Text("   Email", style: TextStyle(fontSize: 18)),
                SizedBox(height: _height * 0.002),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder()
                          .copyWith(borderRadius: BorderRadius.circular(15)),
                      hintText: "Enter You E mail Address"),
                ),
                SizedBox(height: _height * 0.03),
                Text("   Password", style: TextStyle(fontSize: 18)),
                SizedBox(height: _height * 0.002),
                TextField(
                  controller: passwordController,
                  obscureText: ispassword,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              ispassword = !ispassword;
                            });
                          },
                          icon: (ispassword)
                              ? Icon(Icons.remove_red_eye_outlined)
                              : Icon(Icons.remove_red_eye)),
                      prefixIcon: Icon(Icons.password_sharp),
                      border: OutlineInputBorder()
                          .copyWith(borderRadius: BorderRadius.circular(15)),
                      label: Text("Password"),
                      hintText: "Enter You PassWord "),
                ),
                CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: Remember,
                    onChanged: (val) {
                      setState(() {
                        Remember = !Remember;
                      });
                    },
                    title: Text("Remember Me")),
                SizedBox(height: _height * 0.02),
                SizedBox(
                    height: _height * 0.05,
                    width: _widht,
                    child: ElevatedButton(
                        onPressed: () async {
                          User? current = await FirebaseAuthHelper
                              .firebaseAuthHelper
                              .currentUser();
                          try {
                            User? user = await FirebaseAuthHelper
                                .firebaseAuthHelper
                                .signInUser(
                                    email: emailController.text,
                                    password: passwordController.text);

                            if (user != null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("LogIn Sucessfull..."),
                                backgroundColor: Colors.green,
                                behavior: SnackBarBehavior.floating,
                              ));
                              if (Remember == true) {
                                SharedPreferences pres =
                                    await SharedPreferences.getInstance();
                                pres.setBool('remember', true);
                                (user.refreshToken ==
                                        "GjF7QheA1IfZQtSO7VvndkGDFMm2")
                                    ? Navigator.of(context)
                                        .pushReplacementNamed('AdminHomePage')
                                    : Navigator.of(context)
                                        .pushReplacementNamed('/',
                                            arguments: (user != null)
                                                ? user
                                                : current);
                              } else {
                                (user.refreshToken ==
                                        "GjF7QheA1IfZQtSO7VvndkGDFMm2")
                                    ? Navigator.of(context)
                                        .pushReplacementNamed('AdminHomePage')
                                    : Navigator.of(context)
                                        .pushReplacementNamed('/',
                                            arguments: (user != null)
                                                ? user
                                                : current);
                              }
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Sign In failed..."),
                                backgroundColor: Colors.redAccent,
                                behavior: SnackBarBehavior.floating,
                              ));
                            }
                          } on FirebaseAuthException catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("${e.message}"),
                              backgroundColor: Colors.redAccent,
                              behavior: SnackBarBehavior.floating,
                            ));
                            // Navigator.of(context).pop();
                          }

                          emailController.clear();
                          passwordController.clear();
                          email = null;
                          password = null;
                        },
                        child: Text(
                          "LogIn",
                          style: TextStyle(fontSize: 20),
                        ))),
                SizedBox(height: _height * 0.04),
                Text(
                    "----------------------------Or With--------------------------",
                    style: TextStyle(fontSize: 17)),
                SizedBox(height: _height * 0.04),
                SizedBox(
                  height: _height * 0.05,
                  width: _widht,
                  child: OutlinedButton(
                      onPressed: () async {
                        User? user = await FirebaseAuthHelper.firebaseAuthHelper
                            .singInWithGoogle();

                        if (user != null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("LogIn Sucessfull..."),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                          ));

                          SharedPreferences pres =
                              await SharedPreferences.getInstance();
                          pres.setBool('remember', true);
                          print("====================");
                          print(user.uid);
                          print("====================");

                          (user.uid == "GjF7QheA1IfZQtSO7VvndkGDFMm2")
                              ? Navigator.of(context)
                                  .pushReplacementNamed('AdminHomePage')
                              : Navigator.of(context)
                                  .pushReplacementNamed('/', arguments: user);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("LogIn failed..."),
                            backgroundColor: Colors.redAccent,
                            behavior: SnackBarBehavior.floating,
                          ));
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/Google Logo.png",
                            height: 30,
                          ),
                          Text("   Login with Google")
                        ],
                      )),
                ),
                SizedBox(height: _height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have an account ? "),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('SignUp_page');
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                  ],
                )
              ]),
        ),
      )),
    );
  }
}
