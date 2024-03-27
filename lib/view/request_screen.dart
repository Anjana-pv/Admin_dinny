import 'package:admin_dinny/controller/repositery/firebase_fuctions.dart';
import 'package:admin_dinny/controller/repositery/image_fuctions.dart';
import 'package:admin_dinny/common/customappbar.dart';
import 'package:admin_dinny/common/reusing_text.dart';
import 'package:admin_dinny/view/home_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApprovalScreen extends StatelessWidget {
  ApprovalScreen({Key? key, required this.id}) : super(key: key);
  final String id;

  final AdminController adminController = AdminController();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = Get.arguments as Map<String, dynamic>?;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 249, 247),
      appBar: CustomAppBar(
        title: "Request",
        icons: false,
        icon: true,
         onDrawerIconPressed: () { 
          Get.back();
         },
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: CachedNetworkImage(
                  imageUrl: data?['profileImage'] ?? '',
                  placeholder: (context, url) =>
                      const CircularProgressIndicator.adaptive(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                  height: 159,
                  width: 329,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
                width: 329,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color.fromARGB(107, 171, 174, 171)),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0, left: 20.0),
                        child: Text(
                          "Restaurant Details",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 30),
                      buildTextRow(
                          "Restaurant Name     :", data?['restaurantName']),
                      buildTextRow("Owner Name             :", data?['owner']),
                      buildTextRow("Type of Restaurant  :", data?['type']),
                      buildTextRow(
                          "City                            :", data?['city']),
                      buildTextRow("Starting time            :",
                          data?['startingtime']?.toString()),
                           buildTextRow("Ending time              :",
                          data?['endingtime']?.toString()),
                      buildTextRow("Total Seats                :",
                          data?['seatCount']?.toString()),
                      buildTextRow(
                          "Address                     :", data?['address']),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              openPdfDocument(data?['pdf']);
                            },
                            child: const Text("Documents",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ),
                          GestureDetector(
                              onTap: () {
                                showMenuImages(data?['menuCards']);
                              },
                              child: const Text("Images",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        adminController.addToAcceptedCollection(data);
                        Get.to(
                          () => ScreenHome(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 4, 163, 63),
                      ),
                      child: const Text(
                        "Accept",
                        style: TextStyle(color: Colors.white),
                      )),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Confirmation"),
                            content:
                                const Text("Are you sure you want to reject?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () async {
                                  print('hello');
                                 adminController.addrejected(data);
                                 Get.offNamed("/home");
                                 
                                },
                                child: const Text("Confirm"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 239, 13, 13),
                    ),
                    child: const Text("Delete",
                        style: TextStyle(color: Colors.white)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
