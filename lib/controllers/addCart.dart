import 'package:e_commerce/modals/AddCartModal.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<AddCartModal> list = [];

  void AddTOCart({required AddCartModal addCartModal}) {
    print("add cart");

    addCartModal.quantity++;
    list.add(addCartModal);

    Set<AddCartModal> set = list.toSet();
    list = set.toList();
    print("======");
    for (int i = 0; i < list.length; i++) {
      print(list[i].Name);
      print(list[i].quantity);
    }

    update();
  }

  get allProduct {
    int totalcount = 0;
    list.forEach((element) {
      totalcount += element.quantity;
    });
    return totalcount;
  }

  get totalPrice {
    num price = 0;
    for (int i = 0; i < list.length; i++) {
      price += (list[i].price * list[i].quantity);
    }
    return price;
  }

  void Countpluse({required AddCartModal product}) {
    product.quantity++;
    update();
  }

  void CountdecrementAndRemove({required AddCartModal product}) {
    if (product.quantity > 1) {
      product.quantity--;

      update();
    }
  }

  void RemoveCart({required AddCartModal addCartModal}) {
    list.remove(addCartModal);
    update();
  }
}
