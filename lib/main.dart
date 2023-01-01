import 'package:flutter/material.dart';
import 'package:ingilizce_turkce_sozluk/DetaySayfa.dart';
import 'package:ingilizce_turkce_sozluk/Kelimeler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Anasayfa(),
      ),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;
  String aramaKelimesi = "";

  Future<List<Kelimeler>> tumKelimeleriGoster() async {
    var kelimelerListesi = <Kelimeler>[];

    var k1 = Kelimeler(1, "Dog", "Köpek");
    var k2 = Kelimeler(2, "Fish", "Balık");
    var k3 = Kelimeler(1, "Table", "Masa");

    try {
      kelimelerListesi.add(k1);
      kelimelerListesi.add(k2);
      kelimelerListesi.add(k3);
    } catch (e) {
      print(e);
    }
    return kelimelerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: aramaYapiliyorMu
              ? TextField(
                  decoration:
                      InputDecoration(hintText: "Arama İçin Bir Şey Yazın"),
                  onChanged: (value) {
                    setState(() {
                      aramaKelimesi = value;
                    });
                  },
                )
              : Text("Sözlük Uygulaması"),
          actions: [
            aramaYapiliyorMu
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        aramaYapiliyorMu = false;
                      });
                      aramaKelimesi = "";
                      print(aramaYapiliyorMu);
                    },
                    icon: Icon(Icons.cancel))
                : IconButton(
                    onPressed: () {
                      setState(() {
                        aramaYapiliyorMu = true;
                      });

                      print(aramaYapiliyorMu);
                    },
                    icon: Icon(Icons.search))
          ],
        ),
        body: FutureBuilder<List<Kelimeler>>(
          future: tumKelimeleriGoster(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var kelimeler = snapshot.data;
              return ListView.builder(
                itemCount: kelimeler!.length,
                itemBuilder: (context, index) {
                  var kelime = kelimeler[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetaySayfa(
                                  kelime: kelime,
                                ))),
                    child: SizedBox(
                      height: 70,
                      child: Card(
                        child: Row(
                          children: [
                            Text(
                              kelime.ingilizce,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(kelime.turkce),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center();
            }
          },
        ));
  }
}
