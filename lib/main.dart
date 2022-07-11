import 'package:flutter/material.dart';
import 'Screens/input_page.dart';
import 'Screens/Result_Page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.light(
            primary: Color(0xFF0A0E21)
        ),
        scaffoldBackgroundColor: Color(0xFF090C22),
        textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white)
        )
      ),
      home: InputPage(),
    );
  }
}


