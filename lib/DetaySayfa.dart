import 'package:flutter/material.dart';
import 'package:ingilizce_turkce_sozluk/Kelimeler.dart';

class DetaySayfa extends StatefulWidget {
  Kelimeler kelime;
  DetaySayfa({required this.kelime});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detay Sayfa"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.kelime.ingilizce,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.amber),
              ),
              Text(
                widget.kelime.turkce,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ],
          ),
        ));
  }
}
