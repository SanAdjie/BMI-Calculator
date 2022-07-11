import 'package:bmi_calculator/Calculator_Brain.dart';
import 'package:bmi_calculator/Screens/Result_Page.dart';
import 'package:flutter/material.dart';
import '../Component/Content_Reusable_Card.dart';
import '../Component/Reusable_Card.dart';
import 'package:bmi_calculator/Constant.dart';
import 'package:bmi_calculator/Component/button.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //Property
  Color tampunganWarna1 = kKodeWarna1;
  Color tampunganWarna2 = kKodeWarna2;

  JenisSex lakiLaki = JenisSex.lakiLaki;
  JenisSex perempuan = JenisSex.perempuan;

  JenisSex tampunganJenisSex;

  int tinggi = 50;
  int beratBadan = 50;
  int umur = 15;

  //Method
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children : <Widget> [
          Expanded(child: Row(
            children: <Widget> [
              Expanded(
                child: ReusableCard(
                    warna: tampunganJenisSex == JenisSex.lakiLaki? tampunganWarna2:tampunganWarna1,
                    onPress: (){
                      setState((){
                        tampunganJenisSex = JenisSex.lakiLaki;
                      });
                    },
                    cardChild: ContentReusableCard(
                      namaIcon: Icons.male,
                      label: "LAKI-LAKI",
                )),
              ),
              Expanded(
                child: ReusableCard(
                  warna: tampunganJenisSex == JenisSex.perempuan? tampunganWarna2:tampunganWarna1,
                  onPress: (){
                    setState((){
                      tampunganJenisSex = JenisSex.perempuan;
                    });
                  },
                  cardChild: ContentReusableCard(
                    namaIcon: Icons.female,
                    label: "PEREMPUAN",
                  )
                ),
              )
            ],
          )),
          Expanded(
              child: ReusableCard(
                  warna: kKodeWarna2,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("TINGGI",style: kGayaTulisan1),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(tinggi.toString(),style: kGayaTulisan3),
                            Text("cm")
                          ]
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          thumbColor: Color(0xFFEC4856)
                        ),
                        child: Slider(
                          value: tinggi.toDouble(),
                          min: kTinggiMinimal,
                          max: kTinggiMaksimal,
                          divisions: 170,
                          activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8E8E97),
                          onChanged: (double valueBaru){
                            setState((){
                              tinggi = valueBaru.round();
                            });
                          }
                        ),
                      )
                    ],
                  )
              )
          ),
          Expanded(child: Row(
            children: <Widget> [
              Expanded(
                child: ReusableCard(
                  warna: kKodeWarna2,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("BERAT BADAN", style: kGayaTulisan1),
                      Text(beratBadan.toString(), style: kGayaTulisan2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TombolBulat(icon: Icons.remove, onPressed: (){
                            setState((){beratBadan--;if(beratBadan==19){beratBadan++;}});
                          }),
                          SizedBox(width: 10),
                          TombolBulat(icon: Icons.add, onPressed: (){
                            setState((){beratBadan++;if(beratBadan==101){beratBadan--;}});
                          }),
                        ]
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  warna: kKodeWarna2,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("UMUR", style: kGayaTulisan1),
                      Text(umur.toString(), style: kGayaTulisan2),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TombolBulat(icon: Icons.remove, onPressed: (){
                              setState((){umur--;if(umur==0){umur++;}});
                            }),
                            SizedBox(width: 10),
                            TombolBulat(icon: Icons.add, onPressed: (){
                              setState((){umur++;if(umur==100){umur--;}});
                            }),
                          ]
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
          GestureDetector(
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(tinggi: tinggi, beratBadan: beratBadan);

              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ResultPage(indexOutput: calc.hasilOutput(), nilaiBMI: calc.getBMI());
              }));
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 15.0),
              color: kKodeWarna3,
              margin: EdgeInsets.only(top: 10),
              height: kContainerBawah,
              width: double.infinity,
              child: Center(
                  child: Text("Seberapa Gemuk Anda?",
                  style: kGayaTulisan4),
            )
            ),
          )]
      ),
    );
  }
}