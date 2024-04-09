
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AdminController extends GetxController {

TextEditingController username=TextEditingController();
TextEditingController password=TextEditingController();
TextEditingController rejection=TextEditingController();
 List<String> approvedIds = [];

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
Future<bool> isIdExists(String id) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('approvedOne')
        .where('id', isEqualTo: id)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  // adding accepted------------------------
  Future<void> addToAcceptedCollection(Map<String, dynamic>? data) async {
    if (data != null) {
      try {
        String id = data['id']; // Assuming the ID field is named 'id'
        bool idExists = await isIdExists(id);
        if (!idExists) {
          await FirebaseFirestore.instance
              .collection('approvedOne')
              .add(data);
        }
      } catch (error) {
        print('Error adding to accepted_clients collection: $error');
        rethrow;
      }
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
          .collection('approvedOne') 
          .doc(documentId)
          .delete();
  } else {
    print('Document ID not available');
  }

 }
  Future <void> deleteData(String? documentId) async{
      
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

  Future<List<String>> getApprovedIds() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('approvedOne')
          .get();
    List<String> ids = querySnapshot.docs.map((doc) => doc.id).toList();
       approvedIds = ids; 
      return ids;
    
    } catch (error) {
      print('Error retrieving approved IDs: $error');
      return [];
    }
  }
   bool isIdApproved(String id) {
    
    return approvedIds.contains(id);
  }


final CollectionReference _approvedCollection =FirebaseFirestore.instance.collection('approvedOne');

  final CollectionReference _rejectedCollection =FirebaseFirestore.instance.collection('rejectedOne');

  Future<bool>isApproved(String id) async {
    try {
      final DocumentSnapshot document =
          await _approvedCollection.doc(id).get();
      return document.exists;
    } catch (e) {
      print('Error checking approval status: $e');
      return false;
    }
  }

  Future<bool> isIdRejected(String id) async {
    try {
      final DocumentSnapshot document =
          await _rejectedCollection.doc(id).get();
      return document.exists;
    } catch (e) {
      print('Error checking rejection status: $e');
      return false;
    }
  }
  Future<bool> Approved(String id) {
    return isApproved(id);
  }
  Future<bool> Rejected(String id) {
    return isIdRejected(id);
  }

}


 
    


 