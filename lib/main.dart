import 'package:flutter/material.dart';
import 'package:shopping_app_flutter/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopgo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.teal),
        // colorScheme: ColorScheme.dark(),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(fontWeight: .bold, fontSize: 16),
          prefixIconColor: .fromRGBO(100, 100, 100, 1),
        ),
        textTheme: TextTheme(
          titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          bodySmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          titleLarge: TextStyle(fontWeight: .bold, fontSize: 24),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
        ),
        fontFamily: 'Lato',
      ),
      debugShowCheckedModeBanner: false,
      // home: ProductDetailsPage(product: variables.products[3]),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}
