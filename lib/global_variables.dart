class Product {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.company,
    required this.imageUrl,
    required this.sizes,
  });

  final String id;
  final String title;
  final int price;
  final String company;
  final String imageUrl;
  final List<int> sizes;
}

class CartItem {
  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.company,
    required this.imageUrl,
    required this.size,
  });

  final String id;
  final String title;
  final int price;
  final String company;
  final String imageUrl;
  final int size;
}

final List<Product> products = [
  Product(
    id: '1',
    title: "Men's Nike Shoe",
    price: 144500,
    sizes: [9, 10, 11, 12],
    company: "Nike",
    imageUrl: 'assets/images/shoes_1.png',
  ),
  Product(
    id: '2',
    title: "Addidas Shoe",
    price: 80000,
    sizes: [9, 10, 12],
    company: "Addidas",
    imageUrl: 'assets/images/shoes_2.png',
  ),

  Product(
    id: '3',
    title: "Beta Women's Shoe",
    price: 81000,
    company: "Beta",
    sizes: [8, 9, 10],
    imageUrl: 'assets/images/shoes_3.png',
  ),
  Product(
    id: '4',
    title: "Jordan Shoe",
    price: 142000,
    company: "Nike",
    sizes: [8, 9, 10],
    imageUrl: 'assets/images/shoes_4.png',
  ),
];
