import 'package:flutter/material.dart';
import 'package:shopping_app_flutter/pages/cart_page.dart';

import 'package:shopping_app_flutter/main.dart';

import 'package:glass_liquid_navbar/glass_liquid_navbar.dart';
import 'package:shopping_app_flutter/pages/product_list.dart';

class HomePageState extends State<HomePage> {
  int _index = 0;
  List<Widget> pages = [ProductList(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title, style: TextStyle(fontWeight: .bold)),
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   iconSize: 24,
      //   currentIndex: _index,
      //   onTap: (i) => setState(() => _index = i),
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_cart),
      //       label: "Cart",
      //     ),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      //   ],
      // ),
      bottomNavigationBar: LiquidGlassNavbar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          LiquidNavItem(icon: Icons.home_rounded, label: 'Home'),
          LiquidNavItem(icon: Icons.shopping_bag, label: 'Bag'),
          LiquidNavItem(icon: Icons.person_rounded, label: 'Profile'),
        ],
      ),

      // floatingActionButton: ElevatedButton(
      //   onPressed: () {},
      //   child: Icon(Icons.search_rounded),
      // ),
      // IndexedStack - Store the scroll position and state,
      body: IndexedStack(index: _index, children: pages),
      // body: pages[_index],
    );
  }
}
