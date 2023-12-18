import 'package:flutter/material.dart';

import '../components/my_button.dart';

class IntroPage extends StatelessWidget{

  const IntroPage({Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart, size: 100,color:Theme.of(context).colorScheme.inversePrimary),
            const SizedBox(height:20),
            const Text('Minimal E-commerce', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height:10),
            Text('Premium Quality Products', style: TextStyle(color:Theme.of(context).colorScheme.inversePrimary),),
            const SizedBox(height:30),
            MyButton(onTap:()=>Navigator.pushNamed(context, '/shop'),child:const Icon(Icons.arrow_forward))
          ]
        ),
      ),
    );
  }

}