import 'package:ersag/projectpages/add_page.dart';
import 'package:ersag/projectpages/clean.dart';
import 'package:ersag/projectpages/cosmetics.dart';
import 'package:ersag/projectpages/pills.dart';
import 'package:ersag/projectpages/sprey.dart';
import 'package:ersag/projectpages/uyeol.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  String deneme = 'ok';
  String explain =
      "Bu uygulama Suna Duman tarafından Ersağ firması izni ile yapılmıştır. Tüm hakları saklıdır.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ersağ Evinizde"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UyeOlPageView()));
              },
              icon: const Icon(Icons.group_add_rounded))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          deneme == 'ok'
              ? Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddPageView()))
              : showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                        title: Text("Yetki Dışı"),
                      ));
        },
        child: const Icon(Icons.add_rounded),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _textButton(
                    buttonname: 'Üye Ol',
                  ),
                  _textButton(
                    buttonname: 'Kampanyalar',
                  ),
                  _textButton(
                    buttonname: 'Satıcıya Ulaş',
                  ),
                  _textButton(
                    buttonname: 'Üyelik Detayları',
                  ),
                  _textButton(
                    buttonname: 'Ersağ Hakkında',
                  ),
                ],
              ),
            ),
            const _cardButton(
              headline: 'Temizlik Ürünleri',
              image: 'assets/clean.png',
              page: CleanPageView(),
            ),
            const _cardButton(
              headline: 'Kozmetik Ürünleri',
              image: 'assets/cosmetic.png',
              page: CosmaticsPageView(),
            ),
            const _cardButton(
              headline: 'Takviye Gıdalar',
              image: 'assets/pills.png',
              page: PillsPageView(),
            ),
            const _cardButton(
              headline: 'Yardımcı Ürünler',
              image: 'assets/sprey.png',
              page: SpreyPageView(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                explain,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      )),
    );
  }
}

class _textButton extends StatelessWidget {
  const _textButton({Key? key, required this.buttonname}) : super(key: key);

  final String buttonname;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.blue.shade100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: TextButton(
            onPressed: () {},
            child: Text(
              buttonname,
              style: TextStyle(color: Colors.blue.shade800),
            )));
  }
}

class _cardButton extends StatelessWidget {
  const _cardButton({
    Key? key,
    required this.image,
    required this.headline,
    required this.page,
  }) : super(key: key);

  final String image;
  final String headline;
  final page;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.white, Colors.transparent])),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  headline,
                  style: Theme.of(context).textTheme.headline4?.copyWith(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
