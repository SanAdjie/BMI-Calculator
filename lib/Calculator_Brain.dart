import 'dart:math';
import 'package:flutter/material.dart';

class CalculatorBrain{
  //Property
  int tinggi;
  int beratBadan;
  num bmi;

  //Constructor
  CalculatorBrain({@required this.tinggi, @required this.beratBadan});

  //method
  int hasilOutput() {
    bmi = beratBadan/ pow(tinggi/100, 2);

    if (bmi < 16) {
      return 0;
    } else if (bmi >= 16 && bmi < 17) {
      return 1;
    } else if (bmi >= 17 && bmi < 18.5) {
      return 2;
    } else if (bmi >= 18.5 && bmi < 25) {
      return 3;
    } else if (bmi >= 25 && bmi < 30) {
      return 4;
    } else if (bmi >= 30 && bmi < 35) {
      return 5;
    } else if (bmi >= 35 && bmi < 40) {
      return 6;
    } else if (bmi >= 40){
      return 7;
    }
  }

  String getBMI(){
    return bmi.toStringAsFixed(1);
  }

}