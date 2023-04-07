import 'dart:typed_data';

class AddCartModal {
  String Name;
  int price;
  int quantity;
  Uint8List Image;
  bool like;
  AddCartModal(
      {required this.Name,
      required this.Image,
      required this.price,
      required this.quantity,
      required this.like});

  factory AddCartModal.formMap({required Map data}) {
    return AddCartModal(
        Name: data["name"],
        Image: data["image"],
        price: data["price"],
        quantity: data["quatity"],
        like: data["like"]);
  }
}
