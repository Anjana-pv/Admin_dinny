 import 'package:admin_dinny/view/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

 class AuthencationController extends GetxController{

Future<bool> authenticateUser(String username, String password) async {
    try {
    Rx<bool> checklogged= false.obs;
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('admin_id')
          .where('username', isEqualTo: username)
          .where('password', isEqualTo: password)
          .limit(1)
          .get();
          if(querySnapshot.docs.isNotEmpty){
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool('isLogined', true);
            checklogged=true.obs;
          }
      return checklogged.value  ;
    } catch (e) {
      print('Error authenticating user: $e');
      return false;
    }
  }
  Future<bool> checkLoggedInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLogined') ?? false;
  }
   Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogined', false);
     Get.offAll(const SplashScreen());
  }
}
 