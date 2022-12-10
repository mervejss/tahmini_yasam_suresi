import 'package:tahmini_yasam_suresi/user_data.dart';

class Hesap
{
  UserData _userData;

  Hesap(this._userData);

  double hesaplama()
  {
    double sonuc;
    sonuc= 95 + (_userData.sporGunu) - (_userData.icilenSigara*20);
    sonuc=sonuc+ (_userData.boy/_userData.kilo);


    if(_userData.seciliCinsiyet=="KADIN")
        return sonuc+5;
    else  return sonuc;



  }
}