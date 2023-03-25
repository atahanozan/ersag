import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ersag/projectpages/model/urunekle.dart';

class UrunEkleService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UrunEkle> addUrun(
    String name,
    String type,
    String price,
    String explain,
    String imageurl,
    String uid,
    String date,
  ) async {
    var ref = _firestore.collection('UrunEkle');

    var documentRef = await ref.add({
      'name': name,
      'type': type,
      'price': price,
      'explain': explain,
      'imageurl': imageurl,
      'uid': uid,
      'date': date,
    });

    return UrunEkle(
      id: documentRef.id,
      name: name,
      type: type,
      price: price,
      explain: explain,
      imageurl: imageurl,
      uid: uid,
      date: date,
    );
  }

  Stream<QuerySnapshot> getUrun() {
    var ref = _firestore
        .collection('UrunEkle')
        .orderBy('name', descending: true)
        .snapshots();

    return ref;
  }

  Stream<QuerySnapshot> getUrunTemizlik() {
    var ref = _firestore
        .collection('UrunEkle')
        .where('type', isEqualTo: 'Temizlik')
        .snapshots();

    return ref;
  }

  Stream<QuerySnapshot> getUrunKozmetik() {
    var ref = _firestore
        .collection('UrunEkle')
        .where('type', isEqualTo: 'Kozmetik')
        .snapshots();

    return ref;
  }

  Stream<QuerySnapshot> getUrunTemelGida() {
    var ref = _firestore
        .collection('UrunEkle')
        .where('type', isEqualTo: 'Takviye Gıda')
        .snapshots();

    return ref;
  }

  Stream<QuerySnapshot> getUrunYanUrun() {
    var ref = _firestore
        .collection('UrunEkle')
        .where('type', isEqualTo: 'Yardımcı Ürünler')
        .snapshots();

    return ref;
  }

  Future<void> removeUrun(String docId) {
    var ref = _firestore.collection('UrunEkle').doc(docId).delete();

    return ref;
  }
}
