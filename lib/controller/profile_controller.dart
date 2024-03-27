
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  final Rx<Stream<DocumentSnapshot<Map<String, dynamic>>>> profileStream =
      Rx<Stream<DocumentSnapshot<Map<String, dynamic>>>>(const Stream.empty());
    @override
    void onInit(){
      super.onInit();
      getuserdatas();
    }

    Future<DocumentSnapshot<Map<String, dynamic>>> getadmin(
      userId) async {
    final DocumentSnapshot<Map<String, dynamic>> adminCollection =
        await FirebaseFirestore.instance
            .collection('admin_id')
            .doc(userId)
            .get();
    return adminCollection;
  }
   Future<void> getuserdatas() async {
    SharedPreferences getuserId = await SharedPreferences.getInstance();
    final userId = getuserId.getString('resturent_id');

    profileStream.value = getadmin(userId).asStream();
  }

  
}
