import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'butonlar.dart';

class AnaMenu extends StatefulWidget {
  const AnaMenu({super.key});

  @override
  State<AnaMenu> createState() => _AnaMenuState();
}

class _AnaMenuState extends State<AnaMenu> {
  List<String> items = [];

  void addItem(String input1, DateTime input2) {
    setState(() {
      String formattedDate = DateFormat('dd/MM/yyyy').format(input2);
      String token = "$input1 - $formattedDate";
      items.add(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Zinciri Kırma")),
      body: Column(
        children: [
          SizedBox(
            child: Image.asset(
              'assets/images/logo.png',
              width: 100,
            ),
          ),
          Expanded(
            child: items.isEmpty
                ? Center(child: Text("Henüz eklenen öğe yok."))
                : ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(8),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: Text(items[index]),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                items.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Buton(onAddItem: addItem);
            },
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
} 

