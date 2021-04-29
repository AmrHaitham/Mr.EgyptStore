import 'package:cloud_firestore/cloud_firestore.dart';

class Collections{
  CollectionReference _productsRef = FirebaseFirestore.instance.collection("Products");
  CollectionReference getProductRef(){
    return _productsRef;
  }
}