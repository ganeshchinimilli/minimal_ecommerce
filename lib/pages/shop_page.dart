import 'package:flutter/material.dart';
import 'package:minimal_ecommerce/components/my_product_tile.dart';
import 'package:minimal_ecommerce/models/shop.dart';
import 'package:provider/provider.dart';
import '../components/my_drawer.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});


  @override
  Widget build(BuildContext context) {
      final products = context.watch<Shop>().shop;

    return  Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,

        title:const Text('Shop Page'),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/cart_page');
          },icon:const Icon(Icons.shopping_cart))
        ],
        ),
        drawer: const MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body:ListView(
          children: [
            const SizedBox(height:25),
            Center(child:Text('Please select from list of products below', style: TextStyle(color:Theme.of(context).colorScheme.inversePrimary),)),
            const SizedBox(height:20),
            SizedBox(
            height:550,
            child: ListView.builder(
              padding:EdgeInsets.all(10),
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder:(context, index) => 
                MyProductTile(product: products[index], 
                onTap: ()=>{context.read<Shop>().addToCart(products[index])}),
              ),
          )
          ]
        )
    );
  }
}