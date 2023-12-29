import 'package:admin_dinny/repositery/firebase_fuctions.dart';
import 'package:admin_dinny/screen/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key, required this.profileImage, required this.restaurantName, required this.resturentName});

  final String profileImage;
  final String restaurantName;
  final String resturentName;

  final RxBool requestAccepted = RxBool(false);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 73, 51),
        title: const Text('Admin', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined, color: Colors.white),
            onPressed: () {
              Get.to(const NotificationScreen());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assest/image_10-removebg.png")),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(() {
              return requestAccepted.value
                  ? Card(
                      elevation: 4.0,
                      margin: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 450,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 204, 220, 205),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(profileImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 28.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    capitalize(restaurantName),
                                    style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(); // Return an empty container if the request is not accepted
            }),
          ],
        ),
      ),
    );
  }

  String capitalize(String input) {
    if (input == null || input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }
}
