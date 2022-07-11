import 'package:flutter/material.dart';

class TombolBulat extends StatelessWidget {

  //Property
  final IconData icon;
  final Function onPressed;

  //Constructor
  TombolBulat({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onPressed,
        disabledElevation: 6.0,
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(
            width: 50.0,
            height: 50.0),
        shape: CircleBorder(),
        fillColor: Color(0x28FFFFFF),
        child:Icon(icon)
    );
  }
}
