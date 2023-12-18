import 'package:flutter/material.dart';
import 'package:minimal_ecommerce/models/product.dart';
import 'package:minimal_ecommerce/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
 
  final Product product;
  final void Function()? onTap;
  const MyProductTile({Key? key,required this.product,this.onTap}) : super(key: key);

 void addToCart(BuildContext context){
    // ask dialog or confirmation
    showDialog(context: context, 
    builder: (context)=> AlertDialog(
      title: const Text('Add to cart'),
      content:const Text('Are you sure?'),
      actions:[
        MaterialButton(
          onPressed: (){},
          child:const Text('Cancel')),
        MaterialButton(
          onPressed: (){
            Navigator.pop(context);
            context.read<Shop>().addToCart(product);
          },
          child:const Text('Ok')),
      ]
      ));

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10),
      margin:const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color:Theme.of(context).colorScheme.background),
      ),
      width:300,
      
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
             AspectRatio(
                aspectRatio: 4/3,
                child: Container(
                  decoration: BoxDecoration(
                    color:Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width:double.infinity,
                  height: 200,
                  padding:const EdgeInsets.all(10),
                  child: Image.asset(
                    product.imagePath,
                  ),
                ),
              ),
              const SizedBox(height:20),
              Text(
                product.name,
                style:const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )
              ),
              const SizedBox(height:10),
                Text(
                product.description,
                style: TextStyle(
                  color:Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 15,
                )
              ),
            ],
          ),

          const SizedBox(height:10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('${product.price} \$'),
              ElevatedButton(onPressed:() => addToCart(context), child:const Text('Add to cart', style:TextStyle(color:Color.fromARGB(255, 44, 51, 227))))
          ],)
         
      ],)
    );
  }
}
