import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/controllers/addCart.dart';
import 'package:e_commerce/globa.dart';
import 'package:e_commerce/modals/AddCartModal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/themecontroller.dart';
import '../../../helper/firebase_auth_helper.dart';
import '../../../helper/firestore_helper.dart';
import '../../componenents/myDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

themeController themecontroller = Get.put(themeController());
CartController cartController = Get.put(CartController());

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: Text("Home Page"),
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
                  SharedPreferences pres =
                      await SharedPreferences.getInstance();
                  pres.setBool('remember', global.remember);

                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('login_page', (route) => false);
                },
                icon: Icon(Icons.power_settings_new_outlined)),
          ],
        ),
        drawer: myDrawer(),
        body: StreamBuilder(
            stream:
                FireStoreHelper.fireStoreHelper.fecthchAllData(name: "data"),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Erorr :${snapshot.error}"),
                );
              } else if (snapshot.hasData) {
                QuerySnapshot? querySnapshort = snapshot.data;
                List<QueryDocumentSnapshot> allDocs = querySnapshort!.docs;
                List<Map<String, dynamic>> allData = [];
                List Name = [];
                for (int i = 0; i < allDocs.length; i++) {
                  allData.add(allDocs[i].data() as Map<String, dynamic>);
                }
                for (int i = 0; i < allDocs.length; i++) {
                  Name.add(allDocs[i].id);
                }
                return Column(
                  children: [
                    SizedBox(height: 10),
                    Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: allData.length,
                            itemBuilder: (context, i) {
                              return Container(
                                height: 50,
                                width: 100,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.blue),
                                child: Text("${Name[i]}"),
                              );
                            })),
                    Expanded(
                      flex: 8,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: allData.length,
                        itemBuilder: (context, i) {
                          List demo = allData[i]["data"];
                          print(demo.length);
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${Name[i]}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: demo.length,
                                  itemBuilder: (context, index) {
                                    Uint8List imageU =
                                        base64.decode(demo[index]['image']);
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 170,
                                        color: Colors.blue,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.memory(
                                                imageU,
                                                height: 150,
                                                width: 120,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "${demo[index]["name"]}",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                    "PR : ${demo[index]["price"]}",
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                SizedBox(height: 20),
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        AddCartModal
                                                            addCartModal =
                                                            AddCartModal(
                                                                Name: demo[
                                                                        index]
                                                                    ["name"],
                                                                Image: imageU,
                                                                price: demo[
                                                                        index]
                                                                    ["price"],
                                                                quantity: 0,
                                                                like: false);
                                                        cartController.AddTOCart(
                                                            addCartModal:
                                                                addCartModal);
                                                      },
                                                      child: Container(
                                                        height: 50,
                                                        width: 100,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "ADD",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: (themecontroller
                                                                          .dark)
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                      ),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: Icon(
                                                          Icons.favorite_border,
                                                          color: Colors.red,
                                                        ))
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
