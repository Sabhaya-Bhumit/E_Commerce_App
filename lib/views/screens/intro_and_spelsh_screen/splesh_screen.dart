import 'package:e_commerce/globa.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../helper/firebase_auth_helper.dart';

class splesh_screen extends StatefulWidget {
  const splesh_screen({Key? key}) : super(key: key);

  @override
  State<splesh_screen> createState() => _splesh_screenState();
}

class _splesh_screenState extends State<splesh_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cal();
  }

  add() async {
    User? user = await FirebaseAuthHelper.firebaseAuthHelper.currentUser();

    user?.uid;
    if (user?.uid == "GjF7QheA1IfZQtSO7VvndkGDFMm2") {
      return true;
    } else {
      return false;
    }
  }

  cal() async {
    await Future.delayed(Duration(seconds: 1), () async {
      Navigator.of(context).pushReplacementNamed(
        (global.remember)
            ? await (add())
                ? 'AdminHomePage'
                : '/'
            : 'login_page',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 50),
              CircleAvatar(
                  backgroundImage: AssetImage(
                      "assets/png-transparent-e-commerce-logo-logo-e-commerce-electronic-business-ecommerce-angle-text-service.png"),
                  radius: 100),
              Text(
                "E Commerce App",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              SizedBox(height: 50),
              SizedBox(height: 50),
              Text(
                "Welcome",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              CircularProgressIndicator(color: Colors.amberAccent)
            ],
          ),
        ),
      ),
    );
  }
}
