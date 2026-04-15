import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_flutter/cart_provider.dart';
import 'package:shopping_app_flutter/global_variables.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartProvider>(context, listen: true).cart;

    print("cartItems$cartItems");

    // remove one item from cart.
    void removeItemFromCart(Product item) {
      Provider.of<CartProvider>(context, listen: false).removeProduct(item);
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Shopping Bag")),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];

          return ListTile(
            title: Text(
              cartItem.title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text(cartItem.sizes[0].toString()),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(cartItem.imageUrl.toString()),
            ),
            trailing: IconButton(
              onPressed: () {
                removeItemFromCart(cartItem);
              },
              icon: Icon(Icons.delete, color: Colors.redAccent),
            ),
          );
        },
      ),
    );
  }
}
