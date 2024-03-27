import 'package:admin_dinny/controller/auth/auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  @override
 void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 2), () {
      checkLoginStatus();
    });
  }
   Future<void> checkLoginStatus() async {
    bool isLoggedIn = await AuthencationController().checkLoggedInStatus();
    if (isLoggedIn) {
      Get.offAllNamed('HomeScreen');
    } else {
      Get.offAllNamed('LoginScreen');
    }
  }
}