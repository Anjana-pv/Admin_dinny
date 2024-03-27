import 'package:admin_dinny/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return   Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 59, 21),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 1000),
              builder: (BuildContext context, double opacity, Widget? child) {
                return Opacity(
                  opacity: opacity,
              child: Image.asset('assest/images/text.png'),
                ); 
              }
            ),
            const SizedBox(height: 16),
            // const Text(
            //   // 'WelCome',
            //   style: TextStyle(
            //     fontSize: 24,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.white
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  }

  Future navigationhome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Get.toNamed('HomeScreen');
  }

