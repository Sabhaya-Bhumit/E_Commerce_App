import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../helper/firebase_auth_helper.dart';

class SignUp_page extends StatefulWidget {
  const SignUp_page({Key? key}) : super(key: key);

  @override
  State<SignUp_page> createState() => _SignUp_pageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

String? email;
String? password;

bool ispassword = false;
bool Remember = false;

final GlobalKey<FormState> controller = GlobalKey<FormState>();

class _SignUp_pageState extends State<SignUp_page> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _widht = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: _height * 0.1),
                Center(
                    child: Text("Create an account",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold))),
                SizedBox(height: _height * 0.002),
                Center(
                    child: Text("Connect with your friends today!",
                        style: TextStyle(fontSize: 16))),
                // SizedBox(height: _height * 0.),
                Center(
                  child: Image.asset(
                    "assets/images/Security On-bro.png",
                    width: 300,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                // SizedBox(height: _height * 0.15),
                Text("   Email", style: TextStyle(fontSize: 18)),
                SizedBox(height: _height * 0.012),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter You Email Id";
                    }
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder()
                          .copyWith(borderRadius: BorderRadius.circular(15)),
                      hintText: "Enter You E mail Address"),
                ),
                SizedBox(height: _height * 0.04),
                Text("   Password", style: TextStyle(fontSize: 18)),
                SizedBox(height: _height * 0.012),
                TextFormField(
                    controller: passwordController,
                    obscureText: ispassword,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Your Password";
                      }
                      // else if (val!.length < 6) {
                      //   return "Enter 6 more charecter";
                      // }
                      return null;
                    },
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
                        hintText: "Enter You PassWord ")),
                SizedBox(height: _height * 0.06),
                SizedBox(
                  height: _height * 0.05,
                  width: _widht,
                  child: ElevatedButton(
                      onPressed: () async {
                        int i = 0;
                        if (controller.currentState!.validate()) {
                          try {
                            User? user = await FirebaseAuthHelper
                                .firebaseAuthHelper
                                .signUpUser(
                                    email: emailController.text,
                                    password: passwordController.text);

                            if (user != null) {
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("SignUp Sucessfull..."),
                                backgroundColor: Colors.green,
                                behavior: SnackBarBehavior.floating,
                              ));

                              // Navigator.of(context).pushReplacementNamed('/');
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Sign Up failed..."),
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
                            i++;
                          }
                          if (i == 0) {
                            Navigator.of(context).pop();
                            emailController.clear();
                            passwordController.clear();
                            email = null;
                            password = null;
                          }
                        }
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 20),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
