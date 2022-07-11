import 'package:bmi_calculator/Component/Reusable_Card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constant.dart';

class ResultPage extends StatelessWidget {

  //Property
  List <Widget> outputHasil = [
    Text("SANGAT KURUS", style: TextStyle(color: kKodeWarna7, fontSize: ukuranTeksOutput, fontWeight: FontWeight.bold)),
    Text("KURUS", style: TextStyle(color: kKodeWarna6, fontSize: ukuranTeksOutput,fontWeight: FontWeight.bold)),
    Text("AGAK KURUS", style: TextStyle(color: kKodeWarna5, fontSize: ukuranTeksOutput,fontWeight: FontWeight.bold)),
    Text("NORMAL", style: TextStyle(color: kKodeWarna8, fontSize: ukuranTeksOutput,fontWeight: FontWeight.bold)),
    Text("KELEBIHAN", style: TextStyle(color: kKodeWarna12, fontSize: ukuranTeksOutput,fontWeight: FontWeight.bold)),
    Text("OBESITAS I", style: TextStyle(color: kKodeWarna11, fontSize: ukuranTeksOutput,fontWeight: FontWeight.bold)),
    Text("OBESITAS II", style: TextStyle(color: kKodeWarna10, fontSize: ukuranTeksOutput,fontWeight: FontWeight.bold)),
    Text("OBESITAS III", style: TextStyle(color: kKodeWarna9, fontSize: ukuranTeksOutput,fontWeight: FontWeight.bold))
  ];

  List <String> outputDeskripsi = [
    "Hasil HMI Kamu Sangat rendah, Kamu harus makan lebih banyak!",
    "Hasil HMI kamu rendah, Kamu harus makan lebih banyak!",
    "Hasil HMI kamu Sedikit rendah, Kamu harus makan lebih banyak!",
    "Hasil HMI kamu Bagus, Pertahankan ya!",
    "Hasil HMI kamu Sedikit lebih tinggi, Sebaiknya kurangi makan dan lebih banyak olahraga!",
    "Hasil HMI kamu lebih tinggi, Sebaiknya kurangi makan dan lebih banyak olahraga!",
    "Hasil HMI kamu tinggi, Sebaiknya kurangi makan dan lebih banyak olahraga!",
    "Hasil HMI kamu Sangat tinggi, Kurangi makan dan lakukan olahraga untuk menjaga kesehatanmu!"
  ];

  final int indexOutput;
  final String nilaiBMI;

  //Constructor
  ResultPage({@required this.indexOutput, @required this.nilaiBMI});

  //Methods
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("BMI Calculator")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            alignment: Alignment.bottomLeft,
            child: Text("Hasil Kamu : ", style: kGayaTulisan2_1),
            margin: EdgeInsets.only(left: 10),
          ),
          Expanded(
              child: ReusableCard(
                warna: kKodeWarna2,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(child: outputHasil[indexOutput]),
                    Center(child: Text(nilaiBMI, style: kGayaTulisan5)),
                    Center(child: Text(outputDeskripsi[indexOutput], textAlign: TextAlign.center, style: kGayaTulisan1,))
              ],
            ),
          )),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
                padding: EdgeInsets.only(bottom: 15.0),
                color: kKodeWarna3,
                margin: EdgeInsets.only(top: 10),
                height: kContainerBawah,
                width: double.infinity,
                child: Center(
                  child: Text("Hitung Lagi",
                      style: kGayaTulisan4),
                )
            ),
          )
        ],
      )
    );
  }
}
