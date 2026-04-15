import 'package:flutter/material.dart';
import 'package:shopping_app_flutter/global_variables.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> cart = [];

  void addProduct(CartItem item) {
    cart.add(item);
    notifyListeners();

    print("Add ${item.title} to cart");
  }

  void removeProduct(CartItem item) {
    cart.remove(item);
    notifyListeners();

    print("Remove ${item.title} from cart");
  }
}
