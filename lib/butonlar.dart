import 'package:flutter/material.dart';

class Buton extends StatefulWidget {
  final Function(String, DateTime) onAddItem;

  const Buton({super.key, required this.onAddItem});

  @override
  State<Buton> createState() => _ButonState();
}

class _ButonState extends State<Buton> {
  final TextEditingController girdi1Control = TextEditingController();
  DateTime? secilenTarih;

  Future<void> _tarihSec(BuildContext context) async {
    DateTime? tarih = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (tarih != null) {
      setState(() {
        secilenTarih = tarih;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                  ),
                  TextField(
                    controller: girdi1Control,
                    decoration: InputDecoration(labelText: "Görev"),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: IconButton(
                          onPressed: () => _tarihSec(context),
                          icon: Icon(Icons.calendar_month),
                        ),
                      ),
                      Text('Lütfen tarih seçiniz.'),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {
                      if (girdi1Control.text.isNotEmpty &&
                          secilenTarih != null) {
                        widget.onAddItem(
                          girdi1Control.text,
                          secilenTarih!,
                        );
                        girdi1Control.clear();
                        secilenTarih = null;
                        Navigator.pop(context);
                      }
                    },
                    child: Text("Ekle"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                    child: const Text('Kapat'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
