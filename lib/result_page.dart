import 'package:flutter/material.dart';
import 'package:tahmini_yasam_suresi/hesap.dart';
import 'package:tahmini_yasam_suresi/user_data.dart';
import 'constants.dart';
class ResultPage extends StatelessWidget {

final UserData _userData;
ResultPage(this._userData);


  @override
  Widget build(BuildContext context) {
    String kalanGun=Hesap(_userData).hesaplama().round().toString();
    String mesaj="";
    if(int.parse(kalanGun)<=0)
    {
      mesaj="\nSEN ÇOKTAN ÖLMÜŞSÜN :))";
    }
    else
      mesaj="\nKalan zamanın kıymetini bil :))";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sonuç Sayfası",
          style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Expanded(
            flex: 8,
            child: Center(
                child: Text(
                "$kalanGun Yıl yaşayacaksınız." + mesaj,
              style: kMetinStili,)
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: ()
              {
                Navigator.pop(context);

              },
              child: Text(
                "GERİ DÖN",
                style: kMetinStili,
              ),
          ),
            ),)
        ],
      ),
    );
  }
}
