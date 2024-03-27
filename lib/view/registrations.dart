import 'dart:developer';
import 'package:admin_dinny/controller/repositery/firebase_fuctions.dart';
import 'package:admin_dinny/common/customappbar.dart';
import 'package:admin_dinny/view/home_screen.dart';
import 'package:admin_dinny/view/request_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sampleController = Get.put(AdminController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Registrations',
        icons: false,
        icon: true,

        onDrawerIconPressed: () {
          Get.to(ScreenHome());
        },
      ),
      body: StreamBuilder(
        stream: sampleController.getDatas(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    // Timestamp? timestamp = data['timestamp'] as Timestamp?;
                    String id = document.id;

                    return GestureDetector(
                      onTap: () {
                        sampleController.deleteDataFromFirebase(id);
                        log(id);
                        print('$id');
                        Get.to(
                            ApprovalScreen(
                              id: id,
                            ),
                            arguments: data);
                      },
                      child: Card(
                        elevation: 4.0,
                        margin: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 450,
                          height: 80,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 204, 220, 205),
                          ),
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: data['profileImage'] ?? '',
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator.adaptive(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              ),
                              const SizedBox(width: 40.0),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        capitalize(
                                            data['restaurantName'] ?? ''),
                                        style: const TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(capitalize(data['type'] ?? ''),
                                          style: const TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(capitalize(data['city'] ?? ''),
                                          style: const TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.normal))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String capitalize(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }
}
