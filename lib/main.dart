import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tahmini_yasam_suresi/result_page.dart';
import 'package:tahmini_yasam_suresi/user_data.dart';
import 'constants.dart';
import 'icon_cinsiyet.dart';
import 'my_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.deepPurple[700],
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.deepPurple[400],
          )),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet = "";
  double icilenSigara = 0.0;
  double sporGunu = 0.0;
  int boy = 170, kilo = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TAHMİNİ YAŞAM SÜRESİ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: uygSayfasi(),
    );
  }

  uygSayfasi() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: MyContainer(
                  child: buildRowOutlineButton("BOY"),
                ),
              ),
              Expanded(
                child: MyContainer(
                  child: buildRowOutlineButton("KİLO"),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: MyContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Haftada kaç gün spor yapıyorsunuz ?",
                  style: kMetinStili,
                ),
                Text(
                  sporGunu.round().toString(),
                  style: kSayiStili,
                ),
                Slider(
                  min: 0,
                  max: 7,
                  divisions: 7,
                  value: sporGunu,
                  onChanged: (double newValue) {
                    setState(() {
                      sporGunu = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: MyContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Günde kaç paket sigara içiyorsunuz ?",
                    style: kMetinStili),
                Text(icilenSigara.round().toString(), style: kSayiStili),
                Slider(
                  min: 0,
                  max: 30,
                  divisions: 30,
                  value: icilenSigara,
                  onChanged: (double newValue) {
                    setState(() {
                      icilenSigara = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: MyContainer(
                  onPress: () {
                    setState(() {
                      seciliCinsiyet = "KADIN";
                    });
                  },
                  renk: seciliCinsiyet == "KADIN"
                      ? Colors.lightGreenAccent
                      : Colors.white,
                  child: IconCinsiyet(
                    cinsiyetAdi: "KADIN",
                    cinsiyetIcon: FontAwesomeIcons.venus,
                    cinsiyetRenk: Colors.redAccent,
                  ),
                ),
              ),
              Expanded(
                child: MyContainer(
                  onPress: () {
                    setState(() {
                      seciliCinsiyet = "ERKEK";
                    });
                  },
                  renk: seciliCinsiyet == "ERKEK"
                      ? Colors.lightGreenAccent
                      : Colors.white,
                  child: IconCinsiyet(
                    cinsiyetAdi: "ERKEK",
                    cinsiyetIcon: FontAwesomeIcons.mars,
                    cinsiyetRenk: Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
       ButtonTheme(
         height: 50,
         child: TextButton(
           style: ButtonStyle(
             backgroundColor: MaterialStateProperty.all(Colors.white),
           ),
             onPressed: ()
             {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                   UserData(
                       seciliCinsiyet,
                       icilenSigara,
                       sporGunu,
                       kilo,
                       boy
                   ),
               )));

             },
             child: Text(
               "HESAPLA",
               style: kMetinStili,
             ),
         ),
       )
      ],
    );
  }

  Row buildRowOutlineButton(String boyOrKilo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              "$boyOrKilo",
              style: kMetinStili,
            )),
        SizedBox(width: 8),
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              boyOrKilo == "BOY" ? "$boy" : "$kilo",
              style: kSayiStili,
            )),
        SizedBox(width: 25),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    boyOrKilo == "BOY" ? boy++ : kilo++;
                  });
                },
                child: Icon(
                  Icons.add,
                ),
              ),
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    boyOrKilo == "BOY" ? boy-- : kilo--;
                  });
                },
                child: Icon(
                  Icons.remove,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
