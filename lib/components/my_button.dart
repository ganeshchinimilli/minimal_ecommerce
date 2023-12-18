import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  void Function()? onTap;
  final Widget? child;
  MyButton({Key?key,this.onTap,this.child}):super(key: key);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color:Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding:const EdgeInsets.all(10),

        child:child
      )
    );
  }
}
