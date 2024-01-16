
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AdminController extends GetxController {

TextEditingController username=TextEditingController();
TextEditingController password=TextEditingController();
TextEditingController rejection=TextEditingController();


   final db =FirebaseFirestore.instance;
  
   final CollectionReference datas =
      FirebaseFirestore.instance.collection('clientdetail') ;

      Stream<QuerySnapshot> getDatas() {
    final dataStream = datas.snapshots(); 
    return dataStream; 
      }
// getdata from all list----------------

      Stream<QuerySnapshot> getall()  {
  final CollectionReference accepted =
      FirebaseFirestore.instance.collection('clientdetail');
  final acceptStream = accepted.snapshots();
  return acceptStream;
}


      // getdata from accepted list----------------
Stream<QuerySnapshot> getAccepted()  {
  final CollectionReference accepted =
      FirebaseFirestore.instance.collection('approvedOne');
  final acceptStream = accepted.snapshots();
  return acceptStream;
}

  // adding accepted------------------------
  Future<void> addToAcceptedCollection(Map<String, dynamic>? data) async {
 
    if (data != null) {
      try {
        await FirebaseFirestore.instance
            .collection('approvedOne')
            .add(data);          
      } catch (error) {
         print('Error adding to accepted_clients collection: $error');
        rethrow;
      }
    } else {
    const CircularProgressIndicator();
    }
  }

// adding rejected---------------------

Future<void> addrejected(Map<String, dynamic>? data) async {
  
    if (data != null) {
      await FirebaseFirestore.instance
          .collection('rejected')
          .add(data);
    } else {
      //  print('Data not available');
    }
  
}
// delet----------------------------------------

 Future <void> deleteDataFromFirebase(String? documentId) async{
      
  if (documentId != null) {
   await  FirebaseFirestore.instance
          .collection('clientdetail') 
          .doc(documentId)
          .delete();
  } else {
    print('Document ID not available');
  }

 }
//  get only email id from collection----------------------------
 Future<String> getUserEmail(String id) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('clientdetail')
          .where('id', isEqualTo: id)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs[0]['emailController'] ?? '';
      } else {
        print('User not found with id: $id');
        return '';
      }
    } catch (error) {
      print('Error retrieving user email: $error');
      return '';
    }
  }
}

 
    


 