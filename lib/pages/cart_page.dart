import 'package:flutter/material.dart';
import 'package:minimal_ecommerce/components/my_button.dart';
import 'package:minimal_ecommerce/models/product.dart';
import 'package:minimal_ecommerce/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  void deleteProduct(BuildContext context,Product product){
    context.read<Shop>().removeFromCart(product);
  }
  void payButtonPressed(BuildContext context){
    // show alert 
    showDialog(context: context, 
    builder: (context)=> AlertDialog(
      title: const Text('Pay Now'),
      content:const Text('Are you sure? you want to pay now?'),
      actions:[
        MaterialButton(
          onPressed: (){},
          child:const Text('Cancel')),
        MaterialButton(
          onPressed: (){
            Navigator.pop(context);
            context.read<Shop>().clearCart();
          },
          child:const Text('Ok')),
      ]
      ));

  }
  @override
  Widget build(BuildContext context) {
    final cart  = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cart Page'),
      ),
      backgroundColor:Theme.of(context).colorScheme.background,
      body:Column(
        children: [
          Expanded(
            child: cart.isEmpty? const Center(child: Text('Cart is empty')):ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final product = cart[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text('${product.price} \$'),
                trailing: IconButton(
                  icon:const Icon(Icons.delete),
                  onPressed: ()=>deleteProduct(context,product),
                ),
              );
            },
           ),
         ),
        //  paybutton
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyButton(onTap:() =>payButtonPressed(context),child: const Text('Pay Now')),
        ),
        ],
      )

    );
  }
}