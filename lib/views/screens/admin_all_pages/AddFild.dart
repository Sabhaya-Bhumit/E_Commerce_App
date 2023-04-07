import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

import '../../../helper/firestore_helper.dart';
import '../../componenents/myDrawer.dart';

class AddFild extends StatefulWidget {
  const AddFild({Key? key}) : super(key: key);

  @override
  State<AddFild> createState() => _AddFildState();
}

int values = 1;
TextEditingController nameColtroller = TextEditingController();
TextEditingController priceColtroller = TextEditingController();
String pathImage = "";
File? imagefile2;
String? image;
Future<Uint8List> testComporessList(Uint8List list) async {
  var result = await FlutterImageCompress.compressWithList(
    list, minHeight: 400,
    minWidth: 400,
    quality: 99,
    // rotate: 135,
  );
  print(list.length);
  print(result.length);
  return result;
}

class _AddFildState extends State<AddFild> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD FILD"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          StreamBuilder(
              stream:
                  FireStoreHelper.fireStoreHelper.fecthchAllData(name: "data"),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Erorr :${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  QuerySnapshot? querySnapshort = snapshot.data;
                  List<QueryDocumentSnapshot> allDocs2 = querySnapshort!.docs;

                  List Name = [];
                  for (int i = 0; i < allDocs2!.length; i++) {
                    Name.add(allDocs2[i].id);
                  }
                  Map<String, dynamic> allData2 = {};
                  List<dynamic> list = [];
                  allData2 = (allDocs2[values].data() as Map<String, dynamic>);
                  list = allData2["data"];
                  print(list);
                  print(allData2);
                  int i = -1;
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        DropdownButton(
                            value: values,
                            // hint: const Text("Enter Your Choice"),
                            items: Name.map((e) {
                              i++;
                              return DropdownMenuItem(
                                child: Text("$e"),
                                value: i,
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                values = val!;
                              });
                            }),
                        Align(
                          alignment: Alignment.center,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                  radius: 70,
                                  backgroundImage: (imagefile2 != null)
                                      ? FileImage(imagefile2!)
                                      : null),
                              FloatingActionButton(
                                heroTag: null,
                                onPressed: () async {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: SelectableText(
                                                "You Choise Is Image"),
                                            actions: [
                                              IconButton(
                                                  onPressed: () async {
                                                    try {
                                                      var pickedFile =
                                                          await picker.pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .camera);
                                                      //you can use ImageCourse.camera for Camera capture
                                                      if (pickedFile != null) {
                                                        pathImage =
                                                            pickedFile.path;

                                                        //output /data/user/0/com.example.testapp/cache/image_picker7973898508152261600.jpg
                                                        setState(() {
                                                          imagefile2 =
                                                              File(pathImage);
                                                        }); //convert Path to File
                                                        Uint8List imagebytes =
                                                            await imagefile2!
                                                                .readAsBytes(); //convert to bytes
                                                        //convert bytes to base64 string
                                                        imagebytes =
                                                            await testComporessList(
                                                                imagebytes);
                                                        setState(() {
                                                          image = base64.encode(
                                                              imagebytes);

                                                          print(
                                                              "-----------------------------------");
                                                          print(image);
                                                          print(
                                                              "-----------------------------------");
                                                        });
                                                      } else {
                                                        print(
                                                            "No image is selected.");
                                                      }
                                                    } catch (e) {
                                                      print(
                                                          "error while picking file.");
                                                    }
                                                    setState(() {
                                                      Navigator.of(context)
                                                          .pop();
                                                    });
                                                  },
                                                  icon: Icon(Icons.camera)),
                                              SizedBox(width: 40),
                                              IconButton(
                                                  onPressed: () async {
                                                    try {
                                                      var pickedFile =
                                                          await picker.pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery);
                                                      //you can use ImageCourse.camera for Camera capture
                                                      if (pickedFile != null) {
                                                        pathImage =
                                                            pickedFile.path;

                                                        //output /data/user/0/com.example.testapp/cache/image_picker7973898508152261600.jpg

                                                        setState(() {
                                                          imagefile2 =
                                                              File(pathImage);
                                                        }); //convert Path to File
                                                        Uint8List imagebytes =
                                                            await imagefile2!
                                                                .readAsBytes(); //convert to bytes
                                                        //convert bytes to base64 string
                                                        imagebytes =
                                                            await testComporessList(
                                                                imagebytes);
                                                        setState(() {
                                                          image = base64.encode(
                                                              imagebytes);
                                                          print(
                                                              "-----------------------------------");
                                                          print(image);
                                                          print(
                                                              "-----------------------------------");
                                                        });
                                                      } else {
                                                        print(
                                                            "No image is selected.");
                                                      }
                                                    } catch (e) {
                                                      print(
                                                          "error while picking file.");
                                                    }
                                                    setState(() {
                                                      Navigator.of(context)
                                                          .pop();
                                                    });
                                                  },
                                                  icon: Icon(Icons.album))
                                            ],
                                          ));
                                },
                                child: Icon(Icons.add),
                                mini: true,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                            controller: nameColtroller,
                            decoration:
                                InputDecoration(border: OutlineInputBorder())),
                        SizedBox(height: 20),
                        TextFormField(
                            controller: priceColtroller,
                            decoration:
                                InputDecoration(border: OutlineInputBorder())),
                        ElevatedButton(
                            onPressed: () {
                              int b = list.length;
                              b++;
                              Map map = {
                                "id": b,
                                "name": nameColtroller.text,
                                "price": int.parse(priceColtroller.text),
                                "image": image,
                              };
                              list.add(map);
                              print(list);
                              Map<String, dynamic> map2 = {"data": list};
                              print("===============================");
                              print(map2);
                              print("===============================");
                              print(Name[values]);
                              FireStoreHelper.fireStoreHelper.insertData(
                                  name: "data",
                                  docName: Name[values],
                                  data: map2);
                            },
                            child: Text("Save"))
                      ],
                    ),
                  );
                }
                return Center(child: CircularProgressIndicator());
              }),
        ],
      ),
    );
  }
}
