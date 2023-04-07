import 'package:e_commerce/modals/AddCartModal.dart';
import 'package:e_commerce/views/screens/admin_all_pages/AdminHomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/addCart.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

CartController cartController = Get.put(CartController());

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 12,
            child: GetBuilder<CartController>(
              builder: (controller) {
                return (cartController.list.isEmpty)
                    ? Text(
                        "ADD CART ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    : ListView.builder(
                        itemCount: cartController.list.length,
                        itemBuilder: (context, index) {
                          AddCartModal a = cartController.list[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 5,
                              child: Container(
                                height: _height * 0.22,
                                width: _width,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    border: Border.all(
                                        color: (themecontroller.dark)
                                            ? Colors.white
                                            : Colors.black,
                                        style: BorderStyle.solid,
                                        width: 5),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 5,
                                        child: Column(
                                          children: [
                                            Image.memory(
                                              a.Image,
                                              height: _height * 0.15,
                                            ),
                                            SizedBox(height: _height * 0.01),
                                            Text(
                                              "${a.Name}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            )
                                          ],
                                        )),
                                    Expanded(
                                        flex: 6,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      cartController.Countpluse(
                                                          product: a);
                                                    },
                                                    child: Container(
                                                      height: 50,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          border: Border.all(
                                                              color:
                                                                  Colors.black,
                                                              width: 5)),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "+",
                                                        style: TextStyle(
                                                            fontSize: 30),
                                                      ),
                                                    )),
                                                SizedBox(width: _width * 0.01),
                                                Text(
                                                  "${a.quantity}",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                SizedBox(width: _width * 0.01),
                                                InkWell(
                                                  onTap: () {
                                                    cartController
                                                        .CountdecrementAndRemove(
                                                            product: a);
                                                  },
                                                  child: Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        border: Border.all(
                                                            color: Colors.black,
                                                            width: 5)),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "-",
                                                      style: TextStyle(
                                                          fontSize: 30),
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      cartController.RemoveCart(
                                                          addCartModal: a);
                                                    },
                                                    icon: Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                    ))
                                              ],
                                            ),
                                            Text(
                                              "Price : ${a.price}",
                                              style: TextStyle(fontSize: 20),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          ),
          Expanded(
              flex: 3,
              child: GetBuilder<CartController>(
                builder: (controller) {
                  return Container(
                    width: _width,
                    color: Colors.blue,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: _height * 0.02),
                        Text(
                          "Total Product : ${cartController.allProduct}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: _height * 0.05),
                        Text(
                          "Total Price :  ${cartController.totalPrice}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
