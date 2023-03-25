import 'package:cloud_firestore/cloud_firestore.dart';

class UrunEkle {
  String id;
  String name;
  String type;
  String price;
  String explain;
  String imageurl;
  String uid;
  String date;

  UrunEkle({
    required this.id,
    required this.name,
    required this.type,
    required this.price,
    required this.explain,
    required this.imageurl,
    required this.uid,
    required this.date,
  });

  factory UrunEkle.fromSnapShot(DocumentSnapshot snapshot) {
    return UrunEkle(
        id: snapshot.id,
        name: snapshot['name'],
        type: snapshot['type'],
        price: snapshot['price'],
        explain: snapshot['explain'],
        imageurl: snapshot['imageurl'],
        uid: snapshot['uid'],
        date: snapshot['date']);
  }
}
