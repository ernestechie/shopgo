import 'package:flutter/material.dart';
import 'package:shopping_app_flutter/global_variables.dart';
import 'package:shopping_app_flutter/widgets/product_card.dart';
import 'package:shopping_app_flutter/pages/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  ProductListState createState() => ProductListState();
}

class ProductListState extends State<ProductList> {
  OutlineInputBorder border = const OutlineInputBorder(
    borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
    borderSide: BorderSide(color: .fromRGBO(225, 225, 225, 1)),
  );

  final List<String> filters = const [
    "All",
    "Mentality",
    "Addidas",
    "ZKM",
    "Nike",
    "ZTTW",
  ];

  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  // Navigate to product details page.
  void goToProductDetailsPage(int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ProductDetailsPage(product: products[index]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    print("size: $size");

    return SafeArea(
      child: Column(
        children: [
          // Navbar
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: const Text(
                  'Shopgo\nCollections',
                  style: TextStyle(fontWeight: .bold, fontSize: 24),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),

          // Category navigation
          SizedBox(
            height: 80,
            child: ListView.builder(
              itemCount: filters.length,
              scrollDirection: Axis.horizontal,

              // Render individual item
              itemBuilder: (context, index) {
                final filter = filters[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      backgroundColor:
                          selectedFilter.toLowerCase() == filter.toLowerCase()
                          ? Theme.of(context).primaryColor
                          : const .fromRGBO(235, 245, 250, 1),
                      side: BorderSide(
                        color: const .fromRGBO(235, 245, 250, 1),
                      ),
                      labelStyle: TextStyle(
                        color:
                            selectedFilter.toLowerCase() == filter.toLowerCase()
                            ? Colors.white
                            : Colors.black,
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: Text(filter),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Products List
          // Expanded(
          //   child: Padding(
          //     padding: EdgeInsets.all(10),
          //     child: ListView.builder(
          //       itemCount: products.length,
          //       itemBuilder: (context, index) {
          //         final product = products[index];

          //         return GestureDetector(
          //           onTap: () {
          //             goToProductDetailsPage(index);
          //           },

          //           child: ProductCard(
          //             title: product.title,
          //             price: product.price,
          //             image: product.imageUrl,
          //             backgroundColor: index.isEven
          //                 ? .fromRGBO(216, 240, 253, 1)
          //                 : .fromRGBO(235, 245, 250, 1),
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: size.width >= 768 ? 2 : 1,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1.75,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return GestureDetector(
                    onTap: () {
                      goToProductDetailsPage(index);
                    },

                    child: ProductCard(
                      title: product.title,
                      price: product.price,
                      image: product.imageUrl,
                      backgroundColor: index.isEven
                          ? .fromRGBO(216, 240, 253, 1)
                          : .fromRGBO(235, 245, 250, 1),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
