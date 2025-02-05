import 'package:flutter/material.dart';
import 'package:deneme/ana_menu.dart';

class AliskanliklarListesi {
  const AliskanliklarListesi({required this.gorev, required this.tarih});
  final String gorev;
  final String tarih;
}

class Ekleme extends StatefulWidget {
  const Ekleme({super.key});

  @override
  State<Ekleme> createState() => _EklemeState();
}

class _EklemeState extends State<Ekleme> {
  final TextEditingController kontrol1 = TextEditingController();
  final TextEditingController kontrol2 = TextEditingController();
  List<String> items = [];

  void addItems() {
    String gorev = kontrol1.text.trim();
    String tarih = kontrol2.text.trim();
    if (gorev.isNotEmpty && tarih.isNotEmpty) {
      String ekle = "$gorev - $tarih";
      items.add(ekle);
      kontrol1.clear();
      kontrol2.clear();

    }
  }

  @override
  Widget build(BuildContext context) {
    return AnaMenu();
  }
}

