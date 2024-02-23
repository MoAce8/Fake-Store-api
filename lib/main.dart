import 'package:flutter/material.dart';
import 'package:store/screens/home/home_screen.dart';
import 'package:store/screens/update_product/product_update_screen.dart';
import 'package:store/services/all_products_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        ProductUpdateScreen.id: (context) => ProductUpdateScreen()
      },
    );
  }
}

