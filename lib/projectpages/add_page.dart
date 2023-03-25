import 'package:ersag/projectpages/homepage.dart';
import 'package:ersag/projectpages/service/urunekle_service.dart';
import 'package:flutter/material.dart';

class AddPageView extends StatefulWidget {
  const AddPageView({Key? key}) : super(key: key);

  @override
  State<AddPageView> createState() => _AddPageViewState();
}

class _AddPageViewState extends State<AddPageView> {
  final UrunEkleService _ekleService = UrunEkleService();
  String datenow = DateTime.now().toString();

  String uid = "uid";
  String imageurl = "url";

  String headline = 'Ürün Ekleme';
  int deneme = 0;
  List<String> urunler = [
    'Temizlik',
    'Kozmetik',
    'Takviye Gıda',
    'Yardımcı Ürünler',
  ];

  String dropDownValue = 'Temizlik';
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _pricecontroller = TextEditingController();
  final TextEditingController _explaincontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(headline),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(flex: 1, child: Text("Ürün Adı")),
                Expanded(
                    flex: 2,
                    child: TextField(
                      controller: _namecontroller,
                    )),
              ],
            ),
            Row(
              children: [
                const Expanded(flex: 1, child: Text("Ürün Tipi")),
                Expanded(
                    flex: 2,
                    child: DropdownButton(
                      value: dropDownValue,
                      items: urunler.map((String urunler) {
                        return DropdownMenuItem(
                          value: urunler,
                          child: Text(urunler),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownValue = newValue!;
                        });
                      },
                    )),
              ],
            ),
            Row(
              children: [
                const Expanded(flex: 1, child: Text("Fiyat")),
                Expanded(
                    flex: 2,
                    child: TextField(
                      controller: _pricecontroller,
                    )),
              ],
            ),
            Row(
              children: [
                const Expanded(flex: 1, child: Text("Ürün Açıklaması")),
                Expanded(
                    flex: 2,
                    child: TextField(
                      controller: _explaincontroller,
                    )),
              ],
            ),
            Row(
              children: [
                const Expanded(flex: 1, child: Text("Ürün Fotoğrafı")),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Fotoğraf Ekle'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePageView()));
                      },
                      child: const Text('İptal')),
                  ElevatedButton(
                      onPressed: () {
                        _ekleService.addUrun(
                          _namecontroller.text,
                          dropDownValue,
                          _pricecontroller.text,
                          _explaincontroller.text,
                          imageurl,
                          uid,
                          datenow,
                        );
                      },
                      child: const Text('Ekle')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
