import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_flutter/providers/cart_provider.dart';
import 'package:shopping_app_flutter/global_variables.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    final cartItems = cart.cart;

    print("cartItems$cartItems");

    // Remove one item from cart.
    void removeItemFromCart(CartItem item) {
      cart.removeProduct(item);

      // Close alert dialog.
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Shopping Bag")),
      body: cartItems.isEmpty
          ? Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                spacing: 10,
                children: [
                  Icon(Icons.folder_open, size: 52, color: Colors.blueGrey),
                  Text(
                    "Bag is empty",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: .bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "No items in your shopping bag.",
                    style: TextStyle(color: Colors.black45, fontSize: 16),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];

                return ListTile(
                  title: Text(
                    cartItem.title,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  subtitle: Text('${cartItem.size}'),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(cartItem.imageUrl.toString()),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Delete product",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            content: Text(
                              "Are you sure you want to remove ${cartItem.title} from your bag?",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  // Close alert dialog.
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  removeItemFromCart(cartItem);
                                },
                                child: Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.delete, color: Colors.redAccent),
                  ),
                );
              },
            ),
    );
  }
}
