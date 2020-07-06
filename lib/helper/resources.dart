import 'package:flutter/material.dart';

class Resources {
  Color bgColor = Colors.white;
  Color black = Color.fromRGBO(40, 40, 40, 1);
  Color newsCardColor = Colors.white;

  String f1 = 'Poppins';
  String f2 = 'Roboto';
  String f3 = 'Roboto_Slab';
  String f4 = 'Varela_Round';

  TextStyle style(Color color, double size, String font, {isBold = false}) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontFamily: font,
      fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
    );
  }

  Widget customLogo = Container(
    child: Row(
      children: <Widget>[
        Text(
          'TECH',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          '2',
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'STOP',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}
