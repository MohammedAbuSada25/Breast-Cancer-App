import 'dart:ui';

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({required this.color, required this.title, required this.onPressed});

  final Color color;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200,
          height: 42,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

void snackBar(BuildContext context,String text,Color color){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text,style: TextStyle(fontSize: 16),),
    backgroundColor: color,

  ));
}

void navigatePush(BuildContext context, Widget widget) =>
    Navigator.push(context, MaterialPageRoute(
        builder: (context)=>widget
    ));

void navigateReplacement(BuildContext context, Widget widget) =>
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context)=>widget
    ));


Color colorLogo = Color(0xff2e386b);
Color? colorButtonpink = Colors.pink[400];

