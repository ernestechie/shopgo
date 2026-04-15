import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_flutter/providers/cart_provider.dart';
import 'package:shopping_app_flutter/global_variables.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailsPage> createState() => ProductDetailsPageState();
}

// The "State" class we extend, gives access to the "context" property, which is not available in StateLess widget.
class ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSizeIndex = 0;

  // Select product size
  void handleSelectSize(int size) {
    setState(() {
      selectedSizeIndex = size;
    });
  }

  // Add product to cart
  void onAddToCart() {
    CartItem newItem = CartItem(
      id: widget.product.id,
      title: widget.product.title,
      price: widget.product.price,
      company: widget.product.company,
      imageUrl: widget.product.imageUrl,
      size: widget.product.sizes[selectedSizeIndex],
    );

    context.read<CartProvider>().addProduct(newItem);

    // Show success message toast
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          spacing: 8,
          children: [
            Icon(Icons.check, color: Colors.greenAccent),
            Text(
              "Added ${newItem.title} to cart!",
              style: TextStyle(fontWeight: .bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.product.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.all(20),
            child: Image.asset(widget.product.imageUrl, width: 300),
          ),
          const Spacer(),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: const .fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              spacing: 10,
              children: [
                Text(
                  '\$${widget.product.price}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.product.sizes.length,
                    itemBuilder: (context, index) {
                      final size = widget.product.sizes[index];

                      return Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: GestureDetector(
                          child: Chip(
                            label: Text("$size"),
                            backgroundColor: selectedSizeIndex == index
                                ? primaryColor
                                : const .fromRGBO(238, 248, 240, 1),
                            labelStyle: TextStyle(
                              color: selectedSizeIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          onTap: () {
                            handleSelectSize(index);
                          },
                        ),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton.icon(
                    label: Text(
                      "Add to bag",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    icon: Icon(
                      Icons.shopping_bag,
                      size: 20,
                      color: Colors.white,
                    ),
                    onPressed: onAddToCart,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      // minimumSize: const Size(double.infinity, 50),
                      // maximumSize: const Size(double.infinity, 50),
                      fixedSize: Size(350, 50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
