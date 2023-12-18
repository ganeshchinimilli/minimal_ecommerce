  import 'package:flutter/material.dart';

  class MyListStyle extends StatelessWidget {

    final String text;
    final IconData icon;
    final void Function()? onTap;

    const MyListStyle({Key? key,required this.text,required this.icon,this.onTap}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
            leading: Icon(icon,color:Colors.grey),
            title: Text(text),
            onTap:onTap,
        ),
      );
  }
}
