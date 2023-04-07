import 'package:e_commerce/globa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/themecontroller.dart';
import '../../../helper/firebase_auth_helper.dart';
import '../../componenents/myDrawer.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

themeController themecontroller = Get.put(themeController());

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WallCome Admin"),
        actions: [
          GetBuilder<themeController>(
            builder: (controller) {
              return IconButton(
                  onPressed: () {
                    themecontroller.themeChange();
                  },
                  icon: Icon((themecontroller.dark)
                      ? Icons.light_mode
                      : Icons.dark_mode));
            },
          ),
          IconButton(
              onPressed: () async {
                FirebaseAuthHelper.firebaseAuthHelper.singOutUser();
                global.remember = false;
                SharedPreferences pres = await SharedPreferences.getInstance();
                pres.setBool('remember', global.remember);

                Navigator.of(context)
                    .pushNamedAndRemoveUntil('login_page', (route) => false);
              },
              icon: Icon(Icons.power_settings_new_outlined))
        ],
      ),
      drawer: myDrawer(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('AddCategoty');
              },
              child: Text("Category")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('AddFild');
              },
              child: Text("Fild")),
        ],
      ),
    );
  }
}
