import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserController extends GetxController {

   final CollectionReference datas =
      FirebaseFirestore.instance.collection('clients'); 

      Stream<QuerySnapshot> getDatas() {
    final dataStream = datas.snapshots(); 
    return dataStream; 
  }
}
