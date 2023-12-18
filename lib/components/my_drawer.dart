import 'package:flutter/material.dart';
import 'package:minimal_ecommerce/components/my_list_style.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              children: [
                DrawerHeader(child: Center(child: Icon(Icons.shopping_bag, size: 100,color:Theme.of(context).colorScheme.inversePrimary),)),
                const SizedBox(height:20),
                MyListStyle(text: 'Shop', icon: Icons.home, onTap: ()=>Navigator.pop(context)),
                MyListStyle(text: 'Cart', icon: Icons.shopping_cart, onTap: ()=>{
                  Navigator.pop(context),
                  Navigator.pushNamed(context, '/cart_page')
                }),
              ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:25.0),
            child: MyListStyle(text: 'Exit', icon: Icons.logout, onTap: ()=>Navigator.pushNamedAndRemoveUntil(context, '/intro_page', (route) => false)),
          ),
        ]
      )
    );
  }
}