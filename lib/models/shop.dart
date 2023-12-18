import 'package:flutter/material.dart';
import 'package:minimal_ecommerce/models/product.dart';

class Shop extends ChangeNotifier{
  final List<Product> _shop =  [
    Product(name: 'Spects', description: 'Description 1', price: 10, imagePath: 'assets/spects.jpeg'),
    Product(name: 'Hoodies', description: 'Description 2', price: 20,imagePath: 'assets/hoodie.jpeg'),
    Product(name: 'Shoes', description: 'Description 3', price: 30,imagePath: 'assets/shoe.jpeg'),
    Product(name: 'Jeans', description: 'Description 4', price: 40,imagePath: 'assets/jean.jpeg'),
  ];
  List<Product> _cart=[];


  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  void addToCart(Product product){
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product){
    _cart.remove(product);
    notifyListeners();
  }
  void clearCart(){
    _cart.clear();
  }
}