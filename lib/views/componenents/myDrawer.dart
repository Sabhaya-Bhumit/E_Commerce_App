import 'dart:io';

import 'package:e_commerce/views/screens/admin_all_pages/AdminHomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../helper/firebase_auth_helper.dart';

class myDrawer extends StatefulWidget {
  const myDrawer({Key? key}) : super(key: key);

  @override
  State<myDrawer> createState() => _myDrawerState();
}

final ImagePicker picker = ImagePicker();
File? imgfile;

class _myDrawerState extends State<myDrawer> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _widht = MediaQuery.of(context).size.width;
    return Drawer(
        child: FutureBuilder(
      future: FirebaseAuthHelper.firebaseAuthHelper.currentUser(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Error : ${snapshot.error}"));
        } else if (snapshot.hasData) {
          User? user = snapshot.data;
          return Column(children: [
            SizedBox(height: _height * 0.05),
            Align(
                alignment: Alignment.center,
                child: Stack(alignment: Alignment.bottomRight, children: [
                  CircleAvatar(
                    radius: 90,
                    backgroundImage: (user!.photoURL != null)
                        ? NetworkImage("${user.photoURL}")
                        : null,
                    // backgroundImage
                  ),
                  Positioned(
                      top: 50,
                      child: (user.photoURL == null)
                          ? Text(
                              "Add Photo            ",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            )
                          : Text("")),
                  (user.photoURL == null)
                      ? FloatingActionButton(
                          onPressed: () async {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title:
                                          SelectableText("You Choise Is Image"),
                                      actions: [
                                        IconButton(
                                            onPressed: () async {
                                              XFile? image =
                                                  await picker.pickImage(
                                                      source:
                                                          ImageSource.camera);

                                              setState(() {
                                                // String path = File(image!.path);
                                                FirebaseAuthHelper
                                                    .firebaseAuthHelper
                                                    .UpdatePhoto(
                                                        photoURL: image!.path!);
                                                Navigator.of(context).pop();
                                              });
                                            },
                                            icon: Icon(Icons.camera)),
                                        SizedBox(width: 40),
                                        IconButton(
                                            onPressed: () async {
                                              XFile? image =
                                                  await picker.pickImage(
                                                      source:
                                                          ImageSource.gallery);

                                              setState(() {
                                                imgfile = File(image!.path);
                                                FirebaseAuthHelper
                                                    .firebaseAuthHelper
                                                    .UpdatePhoto(
                                                        photoURL: image!.path!);
                                                Navigator.of(context).pop();
                                              });
                                            },
                                            icon: Icon(Icons.album))
                                      ],
                                    ));
                          },
                          child: Icon(Icons.add),
                          mini: true)
                      : Text("")
                ])),
            SizedBox(height: 20),
            (user.displayName != null)
                ? Text(
                    "Name : ${user.displayName}",
                    style: TextStyle(fontSize: 20),
                  )
                : Text("Name : -----------------"),
            SizedBox(height: 20),
            (user.email != null)
                ? Text("Email : ${user.email}", style: TextStyle(fontSize: 16))
                : Text(""),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('CartPage');
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(
                          Icons.shopping_cart_rounded,
                          size: 35,
                        ),
                        Text(" Cart",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  isRow(image: "assets/images/cogwheel.png", name: "Settings"),
                  SizedBox(height: 20),
                  isRow(image: "assets/images/929539.png", name: "Share"),
                  SizedBox(height: 20),
                  isRow(image: "assets/images/732042.png", name: "Rate"),
                  SizedBox(height: 20),
                  isRow(image: "assets/images/546394.png", name: "FeedBcak"),
                  SizedBox(height: 20),
                  InkWell(
                      onTap: () async {
                        Navigator.of(context).pushNamed('ContactUs_Page');
                      },
                      child: isRow(
                          image: "assets/images/597177.png",
                          name: "Contact Number")),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('AboutUs_Page');
                    },
                    child: isRow(
                        image: "assets/images/3503827.png", name: "About"),
                  )
                ],
              ),
            ))
          ]);
        }
        return Center(child: CircularProgressIndicator());
      },
    ));
  }

  Widget isRow({required String image, required String name}) {
    return Row(
      children: [
        SizedBox(width: 20),
        Image.asset(
          "$image",
          width: 30,
          color: (themecontroller.dark) ? Colors.white : Colors.black,
        ),
        SizedBox(width: 10),
        Text(
          "$name",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
