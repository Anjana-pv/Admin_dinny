 import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> authenticateUser(String username, String password) async {
    try {
      
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('admin_id')
          .where('username', isEqualTo: username)
          .where('password', isEqualTo: password)
          .limit(1)
          .get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print('Error authenticating user: $e');
      return false;
    }
  }