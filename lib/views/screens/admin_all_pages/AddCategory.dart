import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/helper/firestore_helper.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD CATEGORY"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: textEditingController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            StreamBuilder(
                stream: FireStoreHelper.fireStoreHelper
                    .fecthchAllData(name: "data"),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Erorr :${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    QuerySnapshot? querySnapshort = snapshot.data;
                    List<QueryDocumentSnapshot> allDocs2 = querySnapshort!.docs;
                    print(allDocs2.length);
                    print(allDocs2[0].data());
                    List<Map<String, dynamic>> allData2 = [];
                    // for (int i = 0; i < allDocs2.length; i++) {
                    //   allData2.add(allDocs2[i].data() as Map<String, dynamic>);
                    // }
                    // print(allData2);
                    return Center(
                      child: Text("success"),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }),
            ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> map = {"data": []};
                  FireStoreHelper.fireStoreHelper.insertData(
                      name: "data",
                      data: map,
                      docName: textEditingController.text);
                },
                child: Text("Save"))
          ],
        ),
      ),
    );
  }
}
