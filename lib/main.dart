import 'package:e_commerce/controllers/themecontroller.dart';
import 'package:e_commerce/globa.dart';
import 'package:e_commerce/views/screens/admin_all_pages/AddCategory.dart';
import 'package:e_commerce/views/screens/admin_all_pages/AddFild.dart';
import 'package:e_commerce/views/screens/admin_all_pages/AdminHomePage.dart';
import 'package:e_commerce/views/screens/intro_and_spelsh_screen/about_us_page.dart';
import 'package:e_commerce/views/screens/intro_and_spelsh_screen/contact_us_page.dart';
import 'package:e_commerce/views/screens/intro_and_spelsh_screen/intro_page.dart';
import 'package:e_commerce/views/screens/intro_and_spelsh_screen/splesh_screen.dart';
import 'package:e_commerce/views/screens/login_and_signUp/SignUp_page.dart';
import 'package:e_commerce/views/screens/login_and_signUp/login_page.dart';
import 'package:e_commerce/views/screens/user_all_pages/CartPage.dart';
import 'package:e_commerce/views/screens/user_all_pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences pres = await SharedPreferences.getInstance();
  global.remember = pres.getBool('remember') ?? false;

  bool istrue = pres.getBool('isskips') ?? false;
  pres.setBool('isskips', istrue);

  await pres.setBool('remember', global.remember);
  themeController themecontroller = Get.put(themeController());
  runApp(
    GetMaterialApp(
      theme: lightTheme(),
      darkTheme: darkTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: (istrue == false) ? 'intro' : 'splesh_screen',
      routes: {
        '/': (context) => HomePage(),
        'login_page': (context) => const login_page(),
        'SignUp_page': (context) => const SignUp_page(),
        'intro': (context) => const intro(),
        'AboutUs_Page': (context) => const AboutUs_Page(),
        'ContactUs_Page': (context) => const ContactUs_Page(),
        'splesh_screen': (context) => const splesh_screen(),
        'AdminHomePage': (context) => AdminHomePage(),
        'AddCategoty': (context) => AddCategory(),
        'AddFild': (context) => AddFild(),
        'CartPage': (context) => CartPage(),
      },
    ),
  );
}
