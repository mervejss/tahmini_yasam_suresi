import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tahmini_yasam_suresi/constants.dart';

class IconCinsiyet extends StatelessWidget {
  final String cinsiyetAdi;
  final IconData cinsiyetIcon;
  final Color cinsiyetRenk;
  IconCinsiyet({required this.cinsiyetAdi, required this.cinsiyetIcon, required this.cinsiyetRenk});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(cinsiyetIcon,size: 60,color: cinsiyetRenk,),
        SizedBox(height: 10,),
        Text("$cinsiyetAdi",
            style: kMetinStili,
        ),
      ],
    );
  }
}