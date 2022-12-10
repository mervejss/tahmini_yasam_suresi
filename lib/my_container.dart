import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {

  late Color renk;
  late final Widget child;
  late final  onPress;

  MyContainer({ this.renk=Colors.white,required this.child, this.onPress});




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(12.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          color: renk,
        ),
      ),
    );
  }
}