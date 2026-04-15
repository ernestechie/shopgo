import 'package:flutter/material.dart';
import 'package:shopping_app_flutter/global_variables.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> cart = [];

  void addProduct(Product product) {
    cart.add(product);
    notifyListeners();

    print("Add ${product.title} to cart");
  }

  void removeProduct(Product product) {
    cart.remove(product);
    notifyListeners();

    print("Remove ${product.title} from cart");
  }
}
