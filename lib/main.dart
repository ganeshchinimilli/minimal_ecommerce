import 'package:flutter/material.dart';
import 'package:minimal_ecommerce/models/shop.dart';
import 'package:provider/provider.dart';
import 'pages/cart_page.dart';
import 'pages/shop_page.dart';
import 'themes/light_mode.dart';
import 'pages/intro_page.dart';


void main() {
  runApp(ChangeNotifierProvider(create: (context)=>Shop(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme:lightMode,
      routes:{
        '/intro':(context) => const IntroPage(),
        '/shop':(context) => const ShopPage(),
        '/cart_page':(context) => const CartPage(),
      }
    );
  }
}
