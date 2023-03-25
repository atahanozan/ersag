import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ersag/projectpages/service/urunekle_service.dart';
import 'package:ersag/projectpages/uyeol.dart';
import 'package:flutter/material.dart';

class SpreyPageView extends StatefulWidget {
  const SpreyPageView({super.key});

  @override
  State<SpreyPageView> createState() => _SpreyPageViewState();
}

class _SpreyPageViewState extends State<SpreyPageView> {
  final UrunEkleService _ekleService = UrunEkleService();
  int uid = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yardımcı Ürünler"),
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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: StreamBuilder(
          stream: _ekleService.getUrunYanUrun(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? const CircularProgressIndicator()
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                    ),
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot myPost = snapshot.data!.docs[index];
                      return InkWell(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: const DecorationImage(
                                        image: AssetImage('assets/sprey.png'),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.white,
                                          Colors.transparent
                                        ])),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      myPost['name'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("${myPost['price']} TL"),
                                    uid == 1
                                        ? InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                        title: Text(
                                                            "${myPost['name']} ürününü silmek istediğinize emin misiniz Suniş hanımcımmmmm :)"),
                                                        actions: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 50),
                                                            child:
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: const Text(
                                                                        "Hayır")),
                                                          ),
                                                          TextButton(
                                                              onPressed: () {
                                                                _ekleService
                                                                    .removeUrun(
                                                                        myPost
                                                                            .id);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                  "Evet"))
                                                        ],
                                                      ));
                                            },
                                            child: const Icon(Icons.remove))
                                        : const Text(""),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(myPost['name']),
                                    content: Text(myPost['explain']),
                                    actions: [
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                  "${myPost['price']} TL")),
                                          Expanded(
                                              flex: 1,
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  'İptal',
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              )),
                                          Expanded(
                                            flex: 1,
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                child:
                                                    const Text('Sipariş Ver')),
                                          ),
                                        ],
                                      )
                                    ],
                                  ));
                        },
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
